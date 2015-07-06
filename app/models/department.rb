class Department < ActiveRecord::Base
  has_many :members, foreign_key: 'general_department_id'
end
