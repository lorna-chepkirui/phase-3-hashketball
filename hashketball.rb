# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
# Start Helper functions
def player(name)
  pls = game_hash.map do |team|
       team[1][:players].flatten(3).find { |player| player[:player_name] == name}
   end
   pls.compact
 end
 
 def players
   pls = game_hash.map do |team|
       team[1][:players]
    end
    pls.compact.flatten(4)
  end
 
 def teams
   tms = game_hash.map do |team|
   {
     "team_name"=>team[1][:team_name],
     "team_colors"=>team[1][:colors],
   }
 end
 tms.compact
 end

 def players_team(name)
  game_hash.map do |data|
    {
      "team_name"=> data[1][:team_name],
      "players"=> data[1][:players]
    }
  end
 end

 def players_shoe_rebounds
  players.map { |player| {"player"=>player[:player_name], "rebounds"=>player[:rebounds], "shoe"=>player[:shoe]}}
 end

 def player_with_highest_rebounds
  max_shoe = 0
  rebounds = 0
  players_shoe_rebounds.filter do |rebound|
    if rebound["shoe"] > max_shoe
      max_shoe = rebound["shoe"]
      rebounds = rebound["rebounds"]
    end
  end
  rebounds
 end

# End Helper functions

def shoe_size(player_name)
   player(player_name)[0][:shoe]
end

def num_points_scored(player_name)
  player(player_name)[0][:points]
end

def player_stats(player_name)
  player(player_name)[0]
end

def team_colors(t_name)
 teams().find { |team| team["team_name"] == t_name }["team_colors"]
end

def team_names
 game_hash.map { |team| team[1][:team_name]}
end

def team_numbers(team_name)
game_hash.find { |team| team[1][:team_name] == team_name }[1][:players]
end


def player_numbers(team_name)
 team_numbers(team_name).map do |player|
   player[:number]
 end
end


def big_shoe_rebounds
  player_with_highest_rebounds
end


pp big_shoe_rebounds
