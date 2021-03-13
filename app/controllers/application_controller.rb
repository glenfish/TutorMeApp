class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    $cloud_name = '\"glenfish\"' # this is the cloud name being referenced on cloudinary

    def auth_is_logged_in
        authenticated = false
        if (:authenticate_student! || :authenticate_tutor!)
            authenticated = true
        end

        if tutor_signed_in?
            @tutor = Tutor.find_by_id(current_tutor)
            @profile = @tutor.profile
            @subjects = @tutor.subjects.all
        end
        


        return authenticated
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :firstname, :lastname, :address_1, :address_2, :postcode, :state, :country])
      
    end

end
