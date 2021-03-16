class HomeController < ApplicationController
    before_action :auth_is_logged_in, only: [:restricted]

    def index
    end
    def restricted
        # shows student's favourited tutors
        if student_signed_in?
            @favourited = current_student.favourites
            favourited_tutors_array = []
            @favourited.each do |fave|
            print "*******************Favourited: #{fave.tutor.id}"
            tutor = Tutor.find_by_id(fave.tutor.id)
            favourited_tutors_array << tutor
            end
            @tutors = favourited_tutors_array
        end
    end

    private


end
