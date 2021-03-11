class StudentController < ApplicationController
    before_action :authenticate_student!
    
    def index
        # @tutor = Tutor.first
    end
    def search
        params.permit(:firstname, :lastname, :email, :country, :state)
        if params[:state] != ''
            @tutors = Tutor.where('lower(state) LIKE ?', "%#{params[:state].downcase}%")
            if params[:country] != ''
                @tutors = @tutors.where('lower(country) LIKE ?', "%#{params[:country].downcase}%")
            end
        end
        if params[:state] == '' and params[:country] != ''
                @tutors = Tutor.where('lower(country) LIKE ?', "%#{params[:country].downcase}%")
        end     
    end
    
    def tutor_profile
        @tutor = Tutor.find_by_id(params[:id])
        @tutor_profile = Profile.find_by(tutor_id: params[:id])
        @exists = current_student.favourites.find_by(tutor_id: params[:id])
    end

    def favourite
        params.permit(:id, :remove)
        exists = current_student.favourites.find_by(tutor_id: params[:id])
        remove = params[:remove]
        if exists and remove
            record = current_student.favourites.find_by_tutor_id(params[:id])
            record.destroy
            flash[:alert] = "Tutor has been removed"
        elsif
            flash[:alert] = "Tutor is already in your favourites"
        end
        
        if !exists
            current_student.favourites.create(tutor_id: params[:id])
            flash[:alert] = "You have added the tutor to your favourites!"
        end
        redirect_to request.referer
    end
end
