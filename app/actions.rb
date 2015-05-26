# Homepage (Root path)
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