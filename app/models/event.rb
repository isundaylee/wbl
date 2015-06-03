class Event < ActiveRecord::Base
  has_many :images

  extend FriendlyId
  friendly_id :title, use: :slugged

  rails_admin do
    field :title
    field :description
  end
end
