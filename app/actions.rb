helpers do
	def current_user
 	@current_user = User.find_by(id: session[:user_id]) if session[:user_id]
	end
end

get '/' do
  	erb :index #display html in /app/views/index.erb
end

get '/login.erb' do
    erb :login
end

get '/signup.erb' do
  	erb :signup
end

get '/profile.erb' do
    erb :profile
end

post '/login.erb' do
	username = params[:username] #params[:FirstName :LastName]
  	password = params[:password]

  	user = User.find_by(username: username)
  	if user.password == password
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

post '/profile.erb' do
  	redirect '/'
end