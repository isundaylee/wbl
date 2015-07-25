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

  task digests: :environment do
    index_url = 'http://wbl.mit.edu/?page_id=634'
    regex = /WBL Digest Vol (.*) No (.*)/

    doc = Nokogiri::HTML(open(index_url).read)

    doc.css('.entry-content a').each do |a|
      url = a['href']
      match = regex.match(a.text)
      page = Nokogiri::HTML(open(url).read)

      page.css('a').each do |a|
        next unless a['href'] =~ /\.pdf$/
        ClubDigest.create!(
          volume: match[1].to_i,
          number: match[2].to_i,
          file: URI.parse(a['href'])
        )

        puts a['href']
        break
      end

      puts a.text
    end
  end
end
