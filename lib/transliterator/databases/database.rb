require 'pg'
require 'pry-byebug'
require 'rspec'

module Transliterator
  class ORM
    def initialize
      @db = PG.connect(host: 'localhost', dbname: 'transliterator')
      build_tables
    end

    def build_tables
      @db.exec(%q[
        CREATE TABLE IF NOT EXISTS users (
          id serial NOT NULL PRIMARY KEY,
          username varchar(30),
          password_digest text
        )])

      @db.exec(%q[
        CREATE TABLE IF NOT EXISTS mosaics (
          id serial NOT NULL PRIMARY KEY,
          user_id integer REFERENCES users(id),
          name text
        )])

      @db.exec(%q[
        CREATE TABLE IF NOT EXISTS museums (
          id serial NOT NULL PRIMARY KEY,
          user_id integer REFERENCES users(id)
        )])

      @db.exec(%q[
        CREATE TABLE IF NOT EXISTS collections (
          id serial NOT NULL PRIMARY KEY,
          user_id integer REFERENCES users(id),
          name text,
          mosaic_id integer REFERENCES mosaics(id),
          museum_id integer REFERENCES museums(id)
        )])

    end


  end

  def self.orm
    @__db_instance ||= ORM.new
  end
end