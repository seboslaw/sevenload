module Sevenload

  class Item < Sevenload::Base

    UPLOAD_URL = "http://api.sevenload.com/rest/1.0/items/"

    def get(video_token, token)
      raise "You must pass a video_token to use this method." unless video_token
      url = UPLOAD_URL + video_token.to_s + "?token-id=" + token.to_s
      url = URI.encode(url)
      easy = Curl::Easy.http_get(url)
      item = XmlSimple.xml_in(easy.body_str)
    end

    def update(video_token, token, title, description)
      raise "You must pass a video_token to use this method." unless video_token
      url = UPLOAD_URL + video_token.to_s + "/update?token-id=" + token.to_s +
        "&title=" + title + "&description=" + description
      url = URI.encode(url)
      easy = Curl::Easy.http_get(url)
      item = XmlSimple.xml_in(easy.body_str)
    end

     def add_tags(video_token, token, tags)
      raise "You must pass a video_token to use this method." unless video_token
	unless (tags.nil? && tags.empty?)      
	tag_a = tags.split(",").collect{ |s| s }
      url = UPLOAD_URL + video_token.to_s + "/tags/add?token-id=" + token.to_s
      i = 0
      tag_a.each do |tag|
        url = url + "&tags[#{i}][language]=de&tags[#{i}][name]=#{tag}"
        i = i+1
      end
      url = URI.encode(url)
      easy = Curl::Easy.http_get(url)
      item = XmlSimple.xml_in(easy.body_str)
	end
    end

     def remove(video_token, token)
      raise "You must pass a video_token to use this method." unless video_token
      url = UPLOAD_URL + video_token.to_s + "/delete?token-id=" + token.to_s
      url = URI.encode(url)
      easy = Curl::Easy.http_get(url)
      item = XmlSimple.xml_in(easy.body_str)
     end

     def comments(video_token, token)
      raise "You must pass a video_token to use this method." unless video_token
      url = UPLOAD_URL + video_token.to_s + "/comments?token-id=" + token.to_s
      url = URI.encode(url)
      easy = Curl::Easy.http_get(url)
      item = XmlSimple.xml_in(easy.body_str)
     end
  end

end # Sevenload
