module StudentHelper
    def is_favourited(id)
        return current_student.favourites.find_by(tutor_id: id)
    end
end
