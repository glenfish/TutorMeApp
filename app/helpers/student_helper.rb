module StudentHelper
    def is_favourited(id)
        return current_student.favourites.find_by(tutor_id: id)
    end

    def get_student_booking_info(booking)
        booking_info = ""
        subject = Subject.find(booking.subject_id)
        subject_title = subject.title.capitalize
        booked_time = booking.time
        booking_amount = "$#{Payment.find_by(booking_id: booking.id).amount}.00"
        case booked_time
        when 1
            booked_time = "#{booked_time} hour"
        else
            booked_time = "#{booked_time} hours"
        end
        tutor = Tutor.find(booking.tutor_id)
        tutor_name = tutor.firstname + ' ' + tutor.lastname
        tutor_email = tutor.email

        booking_info = "<div class='card' style='width: 18rem;'><div class='card-body'><h5 class='card-title'>Booking ID: "
        booking_info << booking.id.to_s
        booking_info << "</h5><h6 class='card-subtitle mb-2 text-muted'>"
        booking_info << booking.created_at.strftime('%d/%m/%Y').to_s
        booking_info << "</h6><p class='card-text'>Tutor: "
        booking_info << tutor_name
        booking_info << "<br>Subject: "
        booking_info << subject_title
        booking_info << "<br>Time: "
        booking_info << booked_time>to_s
        booking_info << "<br>Paid: "
        booking_info << booking_amount.to_s
        booking_info << "<br>Tutor Contact: "
        booking_info << tutor_email
        booking_info << "<br><br><a href="
        booking_info << student_tutor_profile_path(booking.tutor_id)
        booking_info << " class='btn btn-primary btn-sm'>View Profile</a>"
        booking_info << "</p></div></div>"
        


        return booking_info
    end
end
