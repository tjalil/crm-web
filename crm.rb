require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'
require 'sinatra/content_for'

@@rolodex = Rolodex.new

get '/' do
  @create_time = Time.new.strftime("%m-%d-%Y at %H:%M:%S")
  erb :index
end

get '/contacts' do
  erb :show_all_contacts
end

get '/contacts/new' do
  erb :new_contact
end

get "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact 
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit' do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/remove' do
  erb :remove
end

get '/contacts/:id/notes' do
  erb :notes
end

post '/contacts/id' do
  @@rolodex.find(params[:id].to_i)
  redirect = "/contacts/#{params[:id].to_i}"
  redirect to(redirect)
end

post '/contacts' do
  @@rolodex.add_contact(params[:first_name], params[:last_name], params[:email], params[:notes], params[:create_time])
  redirect to('/contacts')
end

post '/contacts/:id/remove' do
  @@rolodex.remove_contact(contact)
  redirect to('/contacts')
end



