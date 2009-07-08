module Sevenload

  class Upload < Sevenload::Base

    UPLOAD_URL = "http://api.sevenload.com/rest/1.0/items/upload"

    def upload(username, token, filename)
      raise "You must create a token to use this method." unless token
      raise "File does not exist (#{filename})." unless File.exists?(filename)

      blk = lambda do |a,b,c,d| 
        process = ((d/c)*100).to_i
        true
      end

      curl = Curl::Easy.new(UPLOAD_URL)
      curl.on_progress(&blk)
      curl.multipart_form_post = true
      curl.http_post(Curl::PostField.file('upload', filename),
        Curl::PostField.content('token-id', token),
        Curl::PostField.content('username', username)
      )
      curl.body_str
#    rescue # FIXME : that's bad to rescue all exceptions, but for now, throw false.
#      false
    end

  end

end # Sevenload
