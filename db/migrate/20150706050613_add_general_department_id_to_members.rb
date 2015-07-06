class AddGeneralDepartmentIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :general_department_id, :integer
  end
end
