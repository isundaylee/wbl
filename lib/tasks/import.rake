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
      doc = Nokogiri::HTML(open(url).read)

      event.images.destroy_all

      doc.css('.attachment-thumbnail').each do |i|
        img_url = i['src']
        orig_url = img_url.gsub('-150x150', '')

        event.images.create(content: open(orig_url))

        puts '  Image "' + orig_url + '" added. '
      end

      puts 'Event "' + title + '" imported. '
    end
  end
end
