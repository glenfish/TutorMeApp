module MembersHelper
    def get_tutor_booking_info(booking)

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
        student = Student.find(booking.student_id)
        student_name = student.firstname + ' ' + student.lastname
        student_email = student.email

        booking_info = []
        booking_info << "Booking ID: #{booking.id}"
        booking_info << "Date Booked: #{booking.created_at.strftime("%d/%m/%Y")}"
        booking_info << "Student: #{student_name}"
        booking_info << "Subject: #{subject_title}"
        booking_info << "Time booked: #{booked_time}"
        booking_info << "Charged: #{booking_amount}"
        booking_info << "Student contact: #{student_email}"
        return booking_info
    end
end
