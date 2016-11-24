require 'sinatra/base'
require './lib/game'

class Battle < Sinatra::Base

enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    p params
    player1 = Player.new(params[:player1_name])
    player2 = Player.new(params[:player2_name])
    $game = Game.new(player1, player2)
    redirect to('/play')
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

   get '/attack' do
     @game = $game
     @game.attack(@game.player2)
     erb(:attack)
   end

   get '/player2turn' do
     @game = $game
     erb(:player2turn)
   end

   get '/player2attack' do
     @game = $game
     @game.attack(@game.player1)
     erb(:player2attack)
   end

  run! if app_file == $0

end
