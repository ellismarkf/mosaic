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

      # @db.exec(%q[
      #   CREATE TABLE IF NOT EXISTS sessions (
      #     id serial NOT NULL PRIMARY KEY,
      #     user_id integer REFERENCES users(id),
      #     PRIMARY KEY (id,user_id)
      #   )])

    end

    # ///////   USERS   ///////////

    def create_user(username, password_digest)
      result = @db.exec_params(%q[
        INSERT INTO users (username, password_digest)
        VALUES ($1, $2)
        RETURNING id;], [username, password_digest])

      result.first
    end

    def check_user(username)
      response = @db.exec("SELECT * FROM users WHERE username = '#{username}';")
      puts response.first
      if response.first == nil
        return nil
      end
      build_user(response.first)
    end

    def get_user(username)
      result = @db.exec(%Q[
        SELECT * FROM users WHERE username = '#{username}';])

      build_user(result.first)
    end

    def build_user(attrs)
      Transliterator::User.new(attrs["username"], attrs["password_digest"], attrs["id"])
    end

    # ///////   MUSEUMS   ///////////

    def create_museum(user_id)
      result = @db.exec_params(%q[
        INSERT INTO users (user_id)
        VALUES ($1)
        RETURNING id;], [user_id])
    end

    # ///////   MOSAICS   ///////////

    def create_mosaic(user_id, name)
      result = @db.exec_params(%q[
        INSERT INTO users (user_id, name)
        VALUES ($1, $2)
        RETURNING id;], [user_id, name])
    end

    # ///////   SESSIONS   ///////////

    def create_session(params)
      response = @db.exec_params(%Q[ INSERT INTO sessions (user_id) VALUES ($1) RETURNING id;], [params[:user_id]])

      response.first["id"]
    end

  end

  def self.orm
    @__db_instance ||= ORM.new
  end
end