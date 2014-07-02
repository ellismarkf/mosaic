require 'pg'

# entities
require_relative 'transliterator/entities/user.rb'
require_relative 'transliterator/entities/mosaic.rb'
require_relative 'transliterator/entities/museum.rb'

#database
require_relative 'transliterator/databases/database.rb'

#scripts
require_relative 'transliterator/scripts/capture_text.rb'

#assets
require_relative 'color_hash.rb'

Mosaic::ORM.new