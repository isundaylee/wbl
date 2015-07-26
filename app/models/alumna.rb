class Alumna < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 5, maximum: 60}
  validates :bio, presence: true, length: {minimum: 5, maximum: 5000}

  has_attached_file :portrait, styles: { normal: "200x200#" }, default_style: :normal
  validates_attachment_content_type :portrait, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  rails_admin do
    field :name
    field :bio
    field :portrait, :paperclip
  end
end
