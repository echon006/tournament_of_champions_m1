class Team < ApplicationRecord
  has_many :players
  has_many :competition_teams
  has_many :competitions, through: :competition_teams

  def average_age
    players.average(:age)
  end



  def self.order_by_average_age

     joins(:players)
    # join the players table
    .select('teams.id, nickname, avg(players.age)')
     # select the team.id and nickname, average the player ages
    .group('teams.id, nickname')
    # condense/group by the id and nicknames
    .order('avg(players.age) desc')
    # order desc
  end


end
