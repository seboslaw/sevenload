module Sevenload

    class Auth < Sevenload::Base
      # Obtains an authorization token.
      def get_token(tokenType, username)
        sig_options = {
          :type => tokenType,
          :forUser => username,
        }
        
        make_request(sig_options, "/tokens/create")
      end

    end

end # Vimeo
