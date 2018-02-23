ENV['RACK_ENV'] ||= 'development'
require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym
require 'sinatra/base'
require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require './models/cafe'
require_relative 'routes'

class Dishes < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :public_folder, 'public', File.dirname(__FILE__)
  set :js_path, 'public/javascripts'
  set :js_url, '/javascripts'
  enable :sessions
  set :views, Proc.new { File.join(root, "views") }
  register Sinatra::ActiveRecordExtension
  use Rack::MethodOverride
end
