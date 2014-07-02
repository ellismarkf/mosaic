require 'digest/sha1'

module Transliterator
  class User

    attr_reader :username, :password_digest, :id

    def initialize(username, password_digest=nil, id=nil)
      @username = username
      @password_digest = Digest::SHA1.hexdigest(password_digest)
      @id = Transliterator.orm.create_user(@username, @password_digest)
    end

  end
end