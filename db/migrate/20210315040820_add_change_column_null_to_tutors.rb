class AddChangeColumnNullToTutors < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:tutors, :firstname, false)
    change_column_null(:tutors, :lastname, false)
    change_column_null(:tutors, :address_1, false)
    change_column_null(:tutors, :state, false)
    change_column_null(:tutors, :country, false)
    change_column_null(:tutors, :postcode, false)
  end
end
