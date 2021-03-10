class MembersController < ApplicationController
    before_action :authenticate_tutor!
    def index
        @tutor = Tutor.find_by_id(current_tutor)
        @profile = @tutor.profile
    end
end
