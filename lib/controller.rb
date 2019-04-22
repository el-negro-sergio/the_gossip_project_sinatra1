require 'gossip'

 class ApplicationController < Sinatra::Base

   get "/" do
      erb :index, locals: {gossips: Gossip.all}
   end

   get "/gossips/new/" do
      erb :new_gossip
   end

   post "/gossips/new/" do
   Gossip.new(params["gossip_author"], params["gossip_content"]).save
   redirect '/'
   end

   get "/gossips/:id" do
   if params [:id].match(/\A\d+\Z/).nil?
      erb :show, locals: {gossip: nil}
   else
      erb :show, locals: {gossip: Gossip.find(params["id"].to_i)}
   end
   end 
end
