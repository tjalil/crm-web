require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'
require 'sinatra/content_for'

@@rolodex = Rolodex.new

# Temporary fake data so that we always find contact with id 1000.
@@rolodex.add_contact("Will", "Richman", "will@bitmakerlabs.com", "co-founder")


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

get "/contacts/1000" do
  @contact = @@rolodex.find(1000)
  erb :show_contact
end

post '/contacts/:id' do
  @@rolodex.find(contact_id)
  redirect to('/contacts')
  #need to redirect to either 'edit', 'remove', 'notes'
end

post '/contacts' do
  @@rolodex.add_contact(params[:first_name], params[:last_name], params[:email], params[:notes])
  redirect to('/contacts')
end

post '/contacts/:id/remove' do
  @@rolodex.remove_contact(contact)
  redirect to('/contacts')
end



