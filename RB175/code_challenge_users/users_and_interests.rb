require "yaml"

require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

before do
  @users = YAML.load_file("data/users.yaml")
end

helpers do
  def count_interests(users)
    count = 0

    users.each do |user, details|
      count += details[:interests].size
    end

    count
  end
end

get "/" do 
  redirect "list_users"
end

get "/list_users" do
  erb :list_users
  # "#{@users}"
end

get "/list_users/:user" do
  @user = params[:user].to_sym
  @user_details = @users[@user]

  # "from :user"
  erb :user
end


# get "/nora" do
# end

# get "/hiroko" do
# end

# get "/list_users/jamy" do
#   erb :jamy
# end

