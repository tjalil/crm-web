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
  #do something
end

get '/contacts/:id/remove' do
  #do something
end

get '/contacts/:id/notes' do
  #do something
end