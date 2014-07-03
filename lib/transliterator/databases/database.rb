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

    def create_user(username, password_digest)
      result = @db.exec_params(%q[
        INSERT INTO users (username, password_digest)
        VALUES ($1, $2)
        RETURNING id;], [username, password_digest])
    end

    def create_museum(user_id)
      result = @db.exec_params(%q[
        INSERT INTO users (user_id)
        VALUES ($1)
        RETURNING id;], [user_id])
    end

    def create_mosaic(user_id, name)
      result = @db.exec_params(%q[
        INSERT INTO users (user_id, name)
        VALUES ($1, $2)
        RETURNING id;], [user_id, name])
    end


  end

  def self.orm
    @__db_instance ||= ORM.new
  end
end