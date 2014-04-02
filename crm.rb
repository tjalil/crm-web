relative_require 'rolodex'
require_relative 'contacts'
require 'sinatra'

get '/' do
  @crm_app_name = "My CRM"
  @create_time = Time.new.strftime("%m-%d-%Y at %H:%M:%S")
  erb :index
end

get '/contacts' do
  @contacts_page_title = "All Contacts"

  @contacts = []
  @contacts << Contacts.new("Julie", "Hache", "julie@bitmakerlabs.com", "Instructor", "The assignment is up!")
  @contacts << Contacts.new("Will", "Richman", "will@bitmakerlabs.com", "Co-Founder", "Keep Bitmaking, bitmakers!")
  @contacts << Contacts.new("Chris", "Johnston", "chris@bitmakerlabs.com", "Instructor", "Alriiiiiight")

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