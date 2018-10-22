Bundler.require
require 'gossip'
require 'Bundler'

class ApplicationController < Sinatra::Base
	
	get '/' do
		erb :index, locals: {gossips: Gossip.all}
	end

	get '/gossips/new/' do
	  erb :new_gossip
	end

	post '/gossips/new/' do
		Gossip.new(params[:gossip_author], params[:gossip_content]).save
		redirect '/'
	end

	get '/gossips/:num' do
		erb :profil, locals: {gossips: Gossip.find(params[:num]), id: params[:num]}
	end

	get '/gossips/edit/:num' do
		erb :edit, locals: {gossips: Gossip.find(params[:num]), id: params[:num]}
	end

	post '/gossips/edit' do
		Gossip.new(params[:num], params[:gossip_content]).save
		redirect '/'
	end


end	