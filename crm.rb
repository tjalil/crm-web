require_relative 'rolodex'
require 'sinatra'
require 'sinatra/content_for'
require'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :notes, String
  property :time_created, String

  DataMapper.finalize
  DataMapper.auto_upgrade!
end

@@rolodex = Rolodex.new

get '/' do
  @create_time = Time.new.strftime("%m-%d-%Y at %H:%M:%S")
  erb :index
end

get '/contacts' do
  erb :show_all_contacts
end

get '/contacts/:id/remove' do
  erb :remove
end

get '/contacts/:id/notes' do
  erb :notes
end

##### ADDING A CONTACT STARTS #####

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  @@rolodex.add_contact(params[:first_name], params[:last_name], params[:email], params[:notes], params[:create_time])
  redirect to('/contacts')
end

##### ADDING A CONTACT ENDS #####

##### SEARCH CONTACT BY ID STARTS #####

get "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact 
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

post '/contacts/id' do
  @@rolodex.find(params[:id].to_i)
  redirect = "/contacts/#{params[:id].to_i}"
  redirect to(redirect)
end

##### SEARCH CONTACT BY ID ENDS #####


##### EDITING CONTACT STARTS #####

post '/contacts/edit' do
  redirect to ("contacts/#{params[:id].to_i}/edit")
end

get '/contacts/:id/edit' do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
      @contact.first_name = params[:first_name]
      @contact.last_name = params[:last_name]
      @contact.email = params[:email]
      @contact.notes = params[:notes]
      redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

##### EDITING CONTACT ENDS #####

##### REMOVE CONTACT STARTS #####

delete "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @@rolodex.remove_contact(@contact)
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

##### REMOVE CONTACT END #####
