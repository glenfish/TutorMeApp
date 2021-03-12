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
        if params[:photo]
            new_profile.photo.attach(params[:photo])
        end
        flash.alert = 'Profile created!'
        redirect_to tutors_path
        
    end

    def create_subjects
        # params.permit(:title, :time)
        title = params[:title].downcase
        time = params[:time]
        new_subject = Subject.new(title: title, time: time, tutor: @tutor)
        print "Your New Subject ************* #{new_subject.inspect}"
        new_subject.save
        flash.alert = 'Your new subject has been added!'
        redirect_to restricted_path
    end

    def update_subjects
        # params.permit(:title, :time, :id)
        title = params[:title].downcase
        time = params[:time]
        subject_id = params[:id]
        subject_record = Subject.where(id: subject_id)
        print "The subject record is #{subject_record}"
        subject_record.update(title: title, time: time)
        flash.alert = 'Your subjects have been updated!'
        redirect_to restricted_path
    end

    def destroy_subject
        Subject.destroy(params[:id])
        redirect_to restricted_path
    end

    private

    def get_tutor_and_profile
    @tutor = Tutor.find_by_id(current_tutor)
    @profile = @tutor.profile
    @subjects = @tutor.subjects.all
    end



end
