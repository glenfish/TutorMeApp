class StudentController < ApplicationController
    before_action :authenticate_student!
    def index
        @tutor = Tutor.first
    end
    def search
        params.permit(:firstname, :lastname, :email, :country)
        if params[:country]
            @tutors = Tutor.where(country: params[:country])
        end
        if params[:email] != ''
            @tutors = @tutors.where(email: params[:email])
        end
        

        
        
    end
end
