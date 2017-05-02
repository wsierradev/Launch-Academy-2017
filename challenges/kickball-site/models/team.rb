require_relative "./team_data"

class Team
attr_accessor :name, :players

def initialize(name)
  @name = name
end

def self.all
team_data = TeamData::ROLL_CALL
list_of_teams = team_data.map do |team_name, player|
  Team.new(team_name)
end
  list_of_teams
end
