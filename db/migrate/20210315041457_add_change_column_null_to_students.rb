class AddChangeColumnNullToStudents < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:students, :firstname, false)
    change_column_null(:students, :lastname, false)
  end
end
