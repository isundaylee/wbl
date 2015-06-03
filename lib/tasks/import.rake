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

  task events: :environment do
    events = {
      'http://wbl.mit.edu/?page_id=593' => 'Career Week 2014',
      'http://wbl.mit.edu/?page_id=371' => 'WBL Board Retreat 4.4.14'
    }

    events.keys.each do |url|
      title = events[url]

      event = Event.find_or_create_by(title: title)

      puts 'Event "' + title + '" imported. '
    end
  end
end
