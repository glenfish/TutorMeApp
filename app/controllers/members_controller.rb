class MembersController < ApplicationController
    before_action :authenticate_tutor!
    before_action :get_tutor_and_profile

    def index
        
    end

    def profile_form
        print params
    end

    private

    def get_tutor_and_profile
    @tutor = Tutor.find_by_id(current_tutor)
    @profile = @tutor.profile
    end

end
