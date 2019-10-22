
require 'gossip'
class ApplicationController < Sinatra::Base
  get '/' do
    "<html><head><title>The Gossip Project</title></head><body><h1>Mon super site de gossip !</h1></body></html>"
  end
  get '/' do
erb :index 
  end

get '/gossips/new' do
erb :new_gossip
end

  post '/gossips/new/' do
  Gossip.new(params["gossip_author"], params["gossip_content"] ).save
  # ton super code qui enregistre un gossip en fonction de params
  redirect '/'
end


  get '/gossips/:id/edit' do
    erb :edit_gossip, locals: {gossip: Gossip.find(params['id'])}
  end


  post '/gossips/:id/edit' do
    puts "Update gossip"
    Gossip.new(params['gossip_author'], params['gossip_content']).update(params['id'])
    
    redirect '/gossip/' + params['id']
  end


end

end
