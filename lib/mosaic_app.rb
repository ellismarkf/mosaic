require 'pg'

# entities
require_relative 'mosaic/entities/user.rb'
require_relative 'mosaic/entities/mosaic.rb'
require_relative 'mosaic/entities/museum.rb'

#database
require_relative 'mosaic/databases/database.rb'

#scripts
require_relative 'mosaic/scripts/capture_text.rb'

Mosaic::ORM.new