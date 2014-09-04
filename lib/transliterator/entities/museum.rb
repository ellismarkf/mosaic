module Transliterator
  class Musuem

    attr_reader :user_id, :id

    def initialize(user_id, id=nil)
      @user_id = user_id
      @id = Transliterator.orm.create_museum(user_id)
    end

  end
end