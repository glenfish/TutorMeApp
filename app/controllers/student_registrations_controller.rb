class StudentRegistrationsController < Devise::RegistrationsController
    def new
        self.resource = resource_class.new(sign_up_params)
    end
end