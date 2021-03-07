class HomeController < ApplicationController
    before_action :auth_is_logged_in
    def index
    end
    def restricted
    end
end
