class MembersController < ApplicationController
    before_action :authenticate_tutor!
    def index
    end
end
