require_relative 'rolodex'
require_relative 'contacts'
require 'sinatra'
require 'sinatra/content_for'

@@rolodex = Rolodex.new

get '/' do
  @create_time = Time.new.strftime("%m-%d-%Y at %H:%M:%S")
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

get '/contacts/:id' do
  erb :id
end

get '/contacts/:id/edit' do
  erb :edit
end

get '/contacts/:id/remove' do
  erb :remove
end

get '/contacts/:id/notes' do
  erb :notes
end

post '/contacts/:id' do
  @@rolodex.get_user_id(contact)
  redirect to('/contacts')
  #need to redirect to either 'edit', 'remove', 'notes'
end

post '/contacts' do
  new_contact = Contacts.new(params[:first_name], params[:last_name], params[:email], params[:note], params[:time_created])
  @@rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

post '/contacts/:id/remove' do
  @@rolodex.remove_contact(contact)
  redirect to('/contacts')
end



