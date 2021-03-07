class ApplicationController < ActionController::Base
    def auth_is_logged_in
        authenticated = false
        if (:authenticate_student! || :authenticate_tutor!)
            authenticated = true
        end
        return authenticated
    end
end
