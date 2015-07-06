class Member < ActiveRecord::Base
  has_attached_file :portrait, :styles => { :normal => "150x200#" },
                    :default_style => :normal

  belongs_to :general_department, class_name: 'Department'

  validates_attachment_content_type :portrait, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  scope :exec, -> { where(exec: true) }

  rails_admin do
    field :name
    field :title
    field :exec
    field :portrait, :paperclip
    field :general_department
  end
end
