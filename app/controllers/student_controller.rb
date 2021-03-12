class StudentController < ApplicationController
    before_action :authenticate_student!
    
    def index
        # @tutor = Tutor.first
    end
    def search
        params.permit(:firstname, :lastname, :country, :state, :subject)
        if params[:subject] != ''
            subject_records = Subject.where('lower(title) LIKE ?', "%#{params[:subject].downcase}%")
            print "Search ********************** #{subject_records.inspect}"
            subject_records.each do |record|
                @tutors = Tutor.where(id: record.tutor_id)
            end

            


        else
            case
            when params[:firstname] != '', params[:lastname] == ''
                @tutors = Tutor.where('lower(firstname) LIKE ?', "%#{params[:firstname].downcase}%")
                if params[:state] != ''
                    @tutors = @tutors.where('lower(state) LIKE ?', "%#{params[:state].downcase}%")
                end
                if params[:country] != ''
                    @tutors = @tutors.where('lower(country) LIKE ?', "%#{params[:country].downcase}%")
                end
            when params[:firstname] != '', params[:lastname] != ''
                @tutors = Tutor.where('lower(firstname) LIKE ?', "%#{params[:firstname].downcase}%")
                @tutors = @tutors.where('lower(lastname) LIKE ?', "%#{params[:lastname].downcase}%")
            when params[:firstname] == '', params[:lastname] != ''
                @tutors = Tutor.where('lower(lastname) LIKE ?', "%#{params[:lastname].downcase}%")
                if params[:state] != ''
                    @tutors = @tutors.where('lower(state) LIKE ?', "%#{params[:state].downcase}%")
                end
                if params[:country] != ''
                    @tutors = @tutors.where('lower(country) LIKE ?', "%#{params[:country].downcase}%")
                end
            else
                case
                when params[:state] != '', params[:country] == ''
                    @tutors = Tutor.where('lower(state) LIKE ?', "%#{params[:state].downcase}%")
                when params[:state] == '', params[:country] != ''
                    @tutors = Tutor.where('lower(country) LIKE ?', "%#{params[:country].downcase}%")
                else
                    @tutors = Tutor.where('lower(state) LIKE ?', "%#{params[:state].downcase}%")
                    @tutors = @tutors.where('lower(country) LIKE ?', "%#{params[:country].downcase}%") 
                end 
            end
        end
    end

    def tutor_profile
        @tutor = Tutor.find_by_id(params[:id])
        @tutor_profile = Profile.find_by(tutor_id: params[:id])
        @exists = current_student.favourites.find_by(tutor_id: params[:id])
        @subjects = @tutor.subjects.all
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
