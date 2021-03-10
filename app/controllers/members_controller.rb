class MembersController < ApplicationController
    before_action :authenticate_tutor!
    before_action :get_tutor_and_profile

    def index
        
    end

    def profile_form
        
    end

    def profile
        if @profile
            @profile.update(title: params[:profile][:title], description: params[:profile][:description])
        else
            flash.now[:alert] = 'Sorry! There was an error saving your profile. Please try again.'
        end
        redirect_to tutors_path, status: 301
    end

    def profile_create
        new_profile = Profile.create(title: params[:title], description: params[:description], tutor_id: @tutor.id)
        print "*************** #{new_profile}"
        redirect_to tutors_path, status: 301
        
    end

    private

    def get_tutor_and_profile
    @tutor = Tutor.find_by_id(current_tutor)
    @profile = @tutor.profile
    end

end
