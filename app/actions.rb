helpers do
	def current_user
 	@current_user = User.find_by(id: session[:user_id]) if session[:user_id]
	end
end

before do
  redirect '/login' if !current_user && request.path != '/login' && request.path != '/signup'
end

get '/' do
    @pins = Pin.all.reverse
    erb :index
end

get '/login' do
    erb :login
end

get '/signup' do
  	erb :signup
end

get '/profile' do
    erb :profile
end

post '/login' do
	username = params[:username]
  	password = params[:password]

  	user = User.find_by(username: username)
  	if user.password = password
    	session[:user_id] = user.id
    	redirect '/'
  	else
    redirect '/login'
  	end
end

post '/signup' do
  username = params[:username]
  password = params[:password]

  user = User.find_by(username: username)
  if user
    redirect '/signup'
  else
    user = User.create(username: username, password: password)
    session[:user_id] = user.id
    redirect '/'
  end
end

post '/profile' do
  	redirect '/'
end

get '/pins/new' do
    erb :new_pin
end

#
#post '/new_pin' do
 #   title = params[:title]
  #  date = params[:date]
   # username = params[:username]
#
 #   pin = Pin.create(title: title, date: date, username: username)
#
 #   redirect '/'
#end
#

get '/pins/:id' do
  @pin = Pin.find(params[:id])
  @pin.inspect
end

post '/pins/create' do
    title = params[:title]
    date = params[:date]
    username = params[:username]

    current_user.pins.create title: title, date: date, username: username
end

post '/pins/create' do
    title = params[:title]
    date = params[:date]
    username = params[:username]

    new_pin = current_user.pins.create title: title, date: date, username: username
    redirect "/pins/#{new_pin.id}"
end

get '/profile/edit' do
    current_user
    erb :profile
end

post '/profile/edit' do
    username = params[:username]
    email = params[:email]
    password = params[:password]

    current_user.update username: username, email: email, password: password

    redirect '/'
end


