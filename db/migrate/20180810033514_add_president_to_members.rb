class AddPresidentToMembers < ActiveRecord::Migration
  def change
      add_column :members, :president, :boolean, default: false
  end
end
