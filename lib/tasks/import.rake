# encoding: utf-8

namespace :import do
  task posts: :environment do
    ['about_us', 'contact_us'].each do |p|
      file = Rails.root.join('app/views/pages/posts/_' + p + '.html.erb')
      content = File.read(file)

      post = Post.find_or_create_by(name: p)
      post.content = content
      post.save!

      puts 'Post "' + p + '" imported. '
    end
  end
end
