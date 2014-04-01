require 'sinatra'

get '/' do
  @crm_app_name = "My CRM"
  @create_time = Time.new.strftime("%m-%d-%Y at %H:%M:%S")
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  #do something
end

get '/contacts/:id' do
  #do something
end

get '/contacts/:id/edit' do
  #do something
end

get '/contacts/:id/remove' do
  #do something
end

get '/contacts/:id/notes' do
  #do something
end