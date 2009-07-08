module Sevenload
    class Base
      include HTTParty
      base_uri 'api.sevenload.com'

      # TODO: Pass an auth token, if you've already got one
      # TODO: implement format_options
      # Requires your API key and secret phrase.
      # The API key and secret are prepended to every request.
      def initialize(api_key, secret, format_options={})
        @auth = { :api_key => api_key }
        @secret = secret
      end
      
      private
      
      def query(sig_options)
        sig_options.merge :username => @auth[:api_key], :password => @secret
      end
      
      def make_request(sig_options, method)
        self.class.post "/rest/1.0#{method}", :query => query(sig_options)
      end

    end # Base

  
end # Vimeo
