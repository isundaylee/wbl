class Sponsor < ActiveRecord::Base
  has_attached_file :logo, styles: { normal: '150x200>' }

  validates_attachment_content_type :logo, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  enum level: [:silver, :gold, :platinum]


  rails_admin do
    field :level
    field :logo, :paperclip
  end

end
