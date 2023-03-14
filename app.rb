#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'haml'
require 'pony'

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
  @error = ''

  
  @username = params[:username] 
  if @username == nil || @username == ''
    @error = 'No name was entered'
    return erb :visit
  end

  if @barber == nil || @barber == ''
    @error = 'No name was entered'
    return erb :visit
  end

  @barber = params[:barber]
  f = File.open './public/visit.txt', 'a'
  f.write "Visiter: #{@username} \nBarber is: #{@barber}\n\n"
  f.close

	erb :visit
end

get '/contacts' do 
  @error = 'asfaf'
  erb :contacts
end

post '/contacts' do
  @username = params[:username]
  @text_area = params[:text]
  
  Pony.mail(
    name:    params[:name],
    mail:    'cooladnrey98@gmail.com',
    to:      'andrewgavrick@yandex.ru',
    subject: 'a',
    body:    @text_area,
    port:    '587',
    via:     :smtp,
    via_options: { 
      address:              'smtp.gmail.com', 
      port:                 '587', 
      enable_starttls_auto: true,
      user_name:            'cooladnrey98@gmail.com', 
      password:             'isodon48', 
      authentication:       :plain, 
      domain:               'localhost.4567'
    })

  # f= File.open './public/contacts.txt', 'a'
  # f.write "Visiter: #{@username} \nReview: #{@text_area} \n"
  # f.close
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


#lesson 24 Home task is to send data from /contacts to my email