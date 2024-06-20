# require "sinatra"
# require "sinatra/reloader"
# require "tilt/erubis"

# get "/" do
#   @title = "List of All Files in the Public Directory"
#   @files = Dir.glob("public/*")

#   erb :public
# end

# list.rb
require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

get "/" do
  @files = Dir.glob("public/*").map {|file| File.basename(file) }.sort
  p params.inspect
  @files.reverse! if params[:sort] == "desc" #where does params come from? -- params is a hash made available to you by Sinatra for route blocks. includes relevant data from the request
  erb :list
end