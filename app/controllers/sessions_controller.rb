class SessionsController < ApplicationController

    get '/login' do 
        erb :'sessions/login'
end


post '/login' do
    #find the user - by username
    user = User.find_by(username: params[:username])
    #check to see if the user exits and  password matches
    if user && user.authenticate(params[:password])
    #put the user into sessions
    session["user_id"]= user.id
    #redirect them somewhere 
    redirect "/entries"
    else
        redirect "/login"
    end
end

 get '/logout' do
    session.clear
    redirect '/'
 end

end