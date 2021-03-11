class HomeController < ApplicationController
    before_action :auth_is_logged_in
    def index
    end
    def restricted
        # @tutor = Tutor.all
        @favourited = current_student.favourites
        favourited_tutors_array = []
        @favourited.each do |fave|
        print "*******************Favourited: #{fave.tutor.id}"
        tutor = Tutor.find_by_id(fave.tutor.id)
        favourited_tutors_array << tutor
        end
        @tutor = favourited_tutors_array
    end
end
