class Member < ActiveRecord::Base
  has_attached_file :portrait, :styles => { :normal => "150x200#" },
                    :default_style => :normal

  rails_admin do
    field :name
    field :title
    field :exec
    field :portrait, :paperclip
  end
end
