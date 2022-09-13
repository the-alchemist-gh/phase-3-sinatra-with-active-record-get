class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/' do
    { message: "Hello world" }.to_json
  end

  get "/games" do
    games = Game.all.order(:title).limit(10)
    games.to_json
  end

  get "/games/:id" do
    games = Game.find(params[:id])
    games.to_json(include: {reviews:{include: :user}})
  end
end
