require 'sinatra'

#class DatasinApp < Sinatra::Base
  get '/' do
    "Hello, world!"
  end
  
  get '/form' do
  	erb :form
  end
  
  post '/form' do
  	@age = params[:age]
  	@job = params[:job]
  	@marital= params[:marital]
  	@education= params[:edu]
  	@default= params[:def]
  	@balance= params[:bal]
  	@housing= params[:house]
  	@loan = params[:loan]
  	@contact= params[:cont]
  	@day= params[:day]
  	@month= params[:month]
  	@campaign= params[:camp]
  	@duration= params[:dur]
  	@previous_days= params[:prevd]
  	@previous= params[:prev]
  	@outcome= params[:outcome]
	@params =["#{@age};#{@job};#{@marital};#{@education};#{@default};#{@balance};#{@housing};#{@loan};#{@contact};#{@day};#{@month};#{@campaign};#{@duration};#{@previous_days};#{@previous};#{@outcome}"]

  	####Insert python call here
  	#@res = exec("python ml.py #{@params}")	
  	@res = `python ml.py #{@params}`	

  	erb :form_res
  end
#end
