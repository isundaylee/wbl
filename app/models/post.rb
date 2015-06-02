class Post < ActiveRecord::Base
  before_save :normalize_name

  rails_admin do
    field :name
    field :content do
      partial 'quill'
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
