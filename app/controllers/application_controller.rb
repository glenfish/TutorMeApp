class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def auth_is_logged_in
        authenticated = false
        if (:authenticate_student! || :authenticate_tutor!)
            authenticated = true
        end
        return authenticated
    end

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :firstname, :lastname, :address_1, :address_2, :postcode, :state, :country])
    end

end
