module Transliterator
  class Mosaic

    attr_reader :user_id, :id

    def initialize(user_id, name, id=nil)
      @user_id = user_id
      @name = name
      @id = Transliterator.orm.create_mosaic(@user_id, @name)
    end

  end
end