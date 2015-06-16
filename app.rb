require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'omniauth-github'
require 'pry'

require_relative 'config/application'

Dir['app/**/*.rb'].each { |file| require_relative file }

helpers do
  def current_user

    user_id = session[:user_id]
    @current_user ||= User.find(user_id) if user_id.present?
  end

  def signed_in?
    current_user.present?
  end
end

def set_current_user(user)
  session[:user_id] = user.id
end

def authenticate!
  unless signed_in?
    flash[:notice] = 'You need to sign in if you want to do that!'
    redirect '/'
  end
end

get '/' do
  @title = "Hello World"
  users_meetups = "tba"
  erb :index, locals: {meetups: users_meetups}
end

get '/view_all/' do
  #add list of all meetups
end

get '/add_meetup' do
  #have a form where they can add a new meetup
  #Meetup.create
end

get '/meetup/:meetup_id' do
  #on click from view all (or etc) page, take meetup_id and put to params[]
  #show information where Meetup.where(id: params['id']) ..something
end

get '/auth/github/callback' do
  auth = env['omniauth.auth']
  user = User.find_or_create_from_omniauth(auth)
  set_current_user(user)
  flash[:notice] = "You're now signed in as #{user.username}!"

  redirect '/'
end

get '/sign_out' do
  session[:user_id] = nil
  flash[:notice] = "You have been signed out."

  redirect '/'
end

get '/example_protected_page' do
  authenticate!
end

post '/add_meetup' do
  #recieves information from form and validates it.
  #throw JAVASCRIPT alert if they dont fill it in right
end
