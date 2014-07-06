require 'pg'

# entities
require_relative 'transliterator/entities/user.rb'
require_relative 'transliterator/entities/mosaic.rb'
require_relative 'transliterator/entities/museum.rb'

#database
require_relative 'transliterator/databases/database.rb'

#scripts
require_relative 'transliterator/scripts/capture_text.rb'
require_relative 'transliterator/scripts/signup.rb'
require_relative 'transliterator/scripts/sign_in.rb'
require_relative 'transliterator/scripts/color_randomizer.rb'

#assets
require_relative '../public/js/color_hash.rb'

Transliterator::ORM.new