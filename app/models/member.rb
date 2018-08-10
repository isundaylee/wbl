class Member < ActiveRecord::Base
  has_attached_file :portrait, :styles => { :normal => "150x200#" },
                    :default_style => :normal

  belongs_to :general_department, class_name: 'Department'

  validates_attachment_content_type :portrait, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


  scope :presidents, -> { where(president: true) }
  scope :exec, -> { where(exec: true).where(president: false) }

  rails_admin do
    field :name
    field :title
    field :president
    field :exec
    field :portrait, :paperclip
    field :general_department
  end
end
