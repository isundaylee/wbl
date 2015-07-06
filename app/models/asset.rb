class Asset < ActiveRecord::Base
  has_attached_file :image, :styles => { :thumb => "200#" }

  validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.url_for(name)
    asset = self.find_by(name: name)

    return '' if asset.nil?

    return asset.image.url
  end

  rails_admin do
    field :name
    field :image, :paperclip
  end
end
