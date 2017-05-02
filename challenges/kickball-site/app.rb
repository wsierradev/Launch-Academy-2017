require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data"

set :bind, '0.0.0.0'  # bind to all interfaces

get "/" do
  "<h1>The LACKP Homepage<h1>"
end

get "/teams" do
  @teams = Team.all
  erb :teams
end

get "/teams/:team_name" do
  "Team Page for #{params[:team_name]}"
  @team_name = params[:team_name]
  @team_hash = TeamData.all_teams[@team_name.to_sym]
  erb :team
end

get "/players/:player_name"
end
get "/positions" do
  @team_hash = TeamData.to_h
  erb :positions
end
