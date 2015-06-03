class Image < ActiveRecord::Base
  belongs_to :event

  has_attached_file :content, :styles => { :large => "1280x800>", :medium => "640x400>", :thumb => "300x300#" }
  validates_attachment_content_type :content, :content_type => /\Aimage\/.*\Z/

  rails_admin do
    field :event
    field :content, :paperclip
  end
end
