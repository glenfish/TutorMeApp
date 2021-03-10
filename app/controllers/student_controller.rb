class StudentController < ApplicationController
    before_action :authenticate_student!
    def index
        # @tutor = Tutor.first
    end
    def search
        params.permit(:firstname, :lastname, :email, :country, :state)
        if params[:state] != ''
            @tutors = Tutor.where('lower(state) LIKE ?', params[:state].downcase)
            if params[:country] != ''
                @tutors = @tutors.where('lower(country) LIKE ?', params[:country].downcase)
            end
        end
        if params[:state] == '' and params[:country] != ''
                @tutors = Tutor.where('lower(country) LIKE ?', "%#{params[:country].downcase}%")
        end


        

        
        
    end
end
