class ClubDigest < ActiveRecord::Base
  has_attached_file :file

  validates :volume, presence: true, numericality: {only_integer: true}
  validates :number, presence: true, numericality: {only_integer: true}

  validates_attachment_content_type :file, content_type: ['application/pdf']

  rails_admin do
    field :volume
    field :number
    field :file, :paperclip
  end
end
