require_relative 'rolodex'
require_relative 'contacts'
require 'sinatra'

@@rolodex = Rolodex.new

get '/' do
  @crm_app_name = "My CRM"
  @create_time = Time.new.strftime("%m-%d-%Y at %H:%M:%S")
  erb :index
end

get '/contacts' do
  @contacts_page_title = "All Contacts"
  erb :contacts
end

get '/contacts/new' do
  @new_contacts_title = "Add New Contact"
  erb :new_contact
end

get '/contacts/:id' do
  #do something
end

get '/contacts/:id/edit' do
  @edit_page_title = "Edit A Contact"
  erb :edit
end

get '/contacts/:id/remove' do
  @remove_page_title = "Remove A Contact"
  erb :remove
end

get '/contacts/:id/notes' do
  @notes_page_title = "Add A Note"
  erb :notes
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