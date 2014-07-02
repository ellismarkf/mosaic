require 'pg'
require 'pry-byebug'
require 'rspec'

module Mosaic
  class ORM
    def initialize
      @db = PG.connect(host: 'localhost', dbname: 'mosaic')
      build_tables
    end

    def build_tables
      @db.exec(%q[
        CREATE TABLE IF NOT EXIST users (
          id serial NOT NULL PRIMARY KEY,
          username varchar(30),
          password_digest text,
          museum_id integer REFERENCES museums(id)
        )])

      @db.exec(%q[
        CREATE TABLE IF NOT EXIST mosaics (
          id serial NOT NULL PRIMARY KEY,
          user_id integer REFERENCES users(id),
          name text
        )])

      @db.exec(%q[
        CREATE TABLE IF NOT EXIST museums (
          id serial NOT NULL PRIMARY KEY,
          user_id integer REFERENCES users(id),
        )])
    end


  end

  def self.orm
    @__db_instance ||= ORM.new
  end
end