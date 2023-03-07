require 'sinatra'

# from server
get '/' do 
  erb :index
end

# to server
post '/' do
  @user_name = params[:user_name]
  @phone     = params[:phone]
  @date_time = params[:date_time]

  @title = 'Thank you!'
  @message = "Dear #{@user_name}, we'll wait gor you at #{@date_time}"

  erb :welcome
end
