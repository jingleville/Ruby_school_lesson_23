#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do 
  erb :about
end

get '/visit' do 
  erb :visit
end

post '/visit' do
  @username = params[:username]
	@barber = params[:barber]
  f = File.open './public/visit.txt', 'a'
  f.write "Visiter: #{@username} \nBarber is: #{@barber}\n\n"
  f.close

	erb :visit
end

get '/contacts' do 
  erb :contacts
end

post '/contacts' do
  @username = params[:username]
  @text_area = params[:text]
  f = File.open './public/contacts.txt', 'a'
  f.write "Visiter: #{@username} \nReview: #{@text_area} \n"
  f.close
	erb :contacts
end



get '/admin' do
  if @login != 'admin'
    return erb :login
  end

  if @password != 'secret'
    return erb :login
  end

  erb :admin
end

post '/admin' do
  @login = params[:login]
  @password = params[:password]

  if @login != 'admin'
    return erb :login
  end

  if @password != 'secret'
    return erb :login
  end

  @users_list = File.read './public/visit.txt'
  erb :admin
end
#HT at 1:44:37