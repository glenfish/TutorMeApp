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
            @profile.photo.attach(params[:profile][:photo])

           
        else
            flash.now[:alert] = 'Sorry! There was an error saving your profile. Please try again.'
        end
        redirect_to tutors_path, status: 301
    end

    def profile_create
        new_profile = Profile.new(title: params[:title], description: params[:description], tutor_id: @tutor.id)
        new_profile.photo.attach(params[:photo])
        print "*************** #{new_profile}"
        new_profile.save
        redirect_to tutors_path, status: 301
        
    end

    private

    def get_tutor_and_profile
    @tutor = Tutor.find_by_id(current_tutor)
    @profile = @tutor.profile
    end

end
