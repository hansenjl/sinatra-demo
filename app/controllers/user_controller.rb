class UserController < ApplicationController

    get '/login' do
        if logged_in?
          redirect to "/users/#{current_user.id}"
        end
        erb :"users/login"
    end

    get '/signup' do
        if logged_in?
          redirect to "/users/#{current_user.id}"
        end
        erb :"users/signup"
    end

    post '/login' do
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to "/users/#{current_user.id}"
        else
            redirect '/login'
        end
    end

    post '/signup' do
        user = User.new(params)
        if user.save
            session[:user_id] = user.id
            redirect to "/users/#{current_user.id}"
        else
            @error = user.errors.full_messages.join(", ")
        end
    end


    get '/logout' do
        session.clear
        redirect to "/login"
    end

    get '/users' do
        if !logged_in?
            redirect to '/login'
        end
        @users = User.all
        erb :"users/index"
    end


    get '/users/:id' do
        if !logged_in?
            redirect to '/login'
        end
        @user = User.find_by_id(params[:id])
        erb :"users/show"
    end


end