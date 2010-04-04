require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
  haml :index
end

get '/screen.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :screen
end

helpers do
  def random_image
    "/images/" + images.sort_by { rand }.first
  end
  
  def images
    @images ||= Dir["#{File.dirname(__FILE__)}/public/images/*"].map { |path| File.basename(path) }
  end
end
