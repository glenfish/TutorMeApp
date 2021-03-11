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
            if params[:profile][:photo]
                @profile.photo.attach(params[:profile][:photo])
            end
            flash.alert = 'Profile updated!'
        end
        redirect_to tutors_path
    end

    def profile_create
        new_profile = Profile.create(title: params[:title], description: params[:description], tutor_id: @tutor.id)
        if params[:profile][:photo] != ''
            new_profile.photo.attach(params[:photo])
        end
        flash.alert = 'Profile created!'
        redirect_to tutors_path
        
    end

    private

    def get_tutor_and_profile
    @tutor = Tutor.find_by_id(current_tutor)
    @profile = @tutor.profile
    end

end
