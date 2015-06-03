class Post < ActiveRecord::Base
  before_save :normalize_name

  rails_admin do
    edit do
      field :name
      field :content do
        partial 'quill'
      end
    end

    list do
      field :name
    end

    show do
      field :name
    end
  end

  def display_html
    return PostContentParser.new(self.content).parse!
  end

  private

    def normalize_name
      self.name = self.name.split.map(&:downcase).join('_')
    end
end
