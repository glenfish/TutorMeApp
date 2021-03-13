class StudentController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:make_booking]
    before_action :authenticate_student!, except: [:make_booking]
    

    def index
        @@student_id = Student.find(current_student.id).id
        country_codes = []
        state_codes = []
        subjects = []
        Tutor.all.each do |tutor|
            country_codes << [tutor.country.upcase,tutor.country.upcase]
            state_codes << [tutor.state.upcase,tutor.state.upcase]
        end
        Subject.all.each do |subject_name|
            subjects << [subject_name.title.downcase,subject_name.title.downcase]
        end
        @country_codes = country_codes.uniq
        @country_codes.unshift(["", ""])
        @state_codes = state_codes.uniq
        @state_codes.unshift(["", ""])
        @subjects = subjects.uniq
        @subjects.unshift(["", ""])
        print "*************#{@country_codes}"
    end
    def search
        params.permit(:firstname, :lastname, :country, :state, :subject, :available)
        if params[:subject] != ''
            tutor_join_subject_match = Tutor.joins(:subjects).where('lower(title) LIKE ?', "%#{params[:subject].downcase}%")
            @tutors = tutor_join_subject_match
            if params[:available] == '1'
                subject_hours_match = tutor_join_subject_match.where("time > ?", 0)
                @tutors = subject_hours_match
            end
            if params[:state] != ''
                @tutors = @tutors.where('lower(state) LIKE ?', "%#{params[:state].downcase}%")
            end
            if params[:country] != ''
                @tutors = @tutors.where('lower(country) LIKE ?', "%#{params[:country].downcase}%")
            end
        else
            case
            when params[:firstname] != '', params[:lastname] == ''
                @tutors = Tutor.where('lower(firstname) LIKE ?', "%#{params[:firstname].downcase}%")
                if params[:state] != ''
                    @tutors = @tutors.where('lower(state) LIKE ?', "%#{params[:state].downcase}%")
                end
                if params[:country] != ''
                    @tutors = @tutors.where('lower(country) LIKE ?', "%#{params[:country].downcase}%")
                end
            when params[:firstname] != '', params[:lastname] != ''
                @tutors = Tutor.where('lower(firstname) LIKE ?', "%#{params[:firstname].downcase}%")
                @tutors = @tutors.where('lower(lastname) LIKE ?', "%#{params[:lastname].downcase}%")
            when params[:firstname] == '', params[:lastname] != ''
                @tutors = Tutor.where('lower(lastname) LIKE ?', "%#{params[:lastname].downcase}%")
                if params[:state] != ''
                    @tutors = @tutors.where('lower(state) LIKE ?', "%#{params[:state].downcase}%")
                end
                if params[:country] != ''
                    @tutors = @tutors.where('lower(country) LIKE ?', "%#{params[:country].downcase}%")
                end
            else
                case
                when params[:state] != '', params[:country] == ''
                    @tutors = Tutor.where('lower(state) LIKE ?', "%#{params[:state].downcase}%")
                when params[:state] == '', params[:country] != ''
                    @tutors = Tutor.where('lower(country) LIKE ?', "%#{params[:country].downcase}%")
                else
                    @tutors = Tutor.where('lower(state) LIKE ?', "%#{params[:state].downcase}%")
                    @tutors = @tutors.where('lower(country) LIKE ?', "%#{params[:country].downcase}%") 
                end 
            end
        end
    end

    def tutor_profile
        @tutor = Tutor.find_by_id(params[:id])
        @tutor_profile = Profile.find_by(tutor_id: params[:id])
        @exists = current_student.favourites.find_by(tutor_id: params[:id])
        @subjects = @tutor.subjects.all
    end

    def favourite
        params.permit(:id, :remove)
        exists = current_student.favourites.find_by(tutor_id: params[:id])
        remove = params[:remove]
        if exists and remove
            record = current_student.favourites.find_by_tutor_id(params[:id])
            record.destroy
            flash[:alert] = "Tutor has been removed"
        elsif
            flash[:alert] = "Tutor is already in your favourites"
        end
        
        if !exists
            current_student.favourites.create(tutor_id: params[:id])
            flash[:alert] = "You have added the tutor to your favourites!"
        end
        redirect_to request.referer
    end
    def make_booking
        tx_id = params[:data][:object][:id]
        subject_id = params[:data][:object][:charges][:data][0][:metadata][:subject_id].to_i
        tutor_id = params[:data][:object][:charges][:data][0][:metadata][:tutor_id].to_i
        subject = Subject.find(subject_id)
        student = Student.find(@@student_id)

        # action: make a booking and a payment and update the hours for the tutor's subject

        if subject.time > 0
            booking = student.bookings.create(tutor_id: tutor_id, time: 1, subject_id: subject_id)
            print "************** Booking ID: #{booking.id}"

            # create the payment using hard coded amount of $60 per hour
            payment = Payment.create(amount: 60, booking_id: booking.id)
            print "************** Payment ID: #{payment.id}"
            # Decrement the number of hours for the tutor's subject
            
            new_subject_hours = subject.time - 1
            subject.update(time: new_subject_hours)
            # flash[:alert] = "You just made a booking!"
            # redirect_to request.referer
        else
            # flash[:alert] = "Sorry there is no time avaiable for that subject!"
            # redirect_to root_url
            print "ALERT*************************************FAILED!!!!!"
        end

    end

    def test_make_booking
        print "&&&&&&&&&&& #{params}"
        
        
        tx_id = params[:data][:object][:id]
        subject_id = params[:data][:object][:charges][:data][0][:metadata][:subject_id].to_i
        tutor_id = params[:data][:object][:charges][:data][0][:metadata][:tutor_id].to_i
        student_id = params[:data][:object][:charges][:data][0][:metadata][:student_id].to_i
        puts "TX: ******* #{tx_id}"
        puts "Subject: ******* #{subject_id}"
        render plain: 'ok'
    end

    def booking_page
        params.permit(:subject, :tutor)
        tutor_id = params[:tutor].to_i
        subject_id = params[:subject].to_i
        subject = Subject.find(subject_id)
        tutor = Tutor.find(tutor_id)
        student_id = current_student.id
        @tutor_fullname = tutor.firstname + ' ' + tutor.lastname
        description = "1 hour of professional tutoring with " + @tutor_fullname
        name = "Subject: " + subject.title.capitalize
        @subject_title = subject.title
        session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            customer_email: 'graycode+stripe@protonmail.com',
            line_items: [{
                name: name,
                description: description,
                images: ['https://res.cloudinary.com/glenfish/image/upload/sr2xeymu1glcpl6bv8w7v7e411js.png'],
                amount: 6000,
                currency: 'aud',
                quantity: 1,
            }],
            payment_intent_data: {
                metadata: {
                    subject: @subject_title,
                    tutor: @tutor_fullname,
                    subject_id: subject_id,
                    tutor_id: tutor_id,
                    student_id: student_id,
                }
            },
            success_url: "#{root_url}students/success",
            cancel_url: "#{root_url}students"
        )
        @session_id = session.id
        

    end

    def success

    end


    def bookings
        # action: show bookings
        @bookings = current_student.bookings.all
    end
end

