require 'sinatra'

get '/' do
  @crm_app_name = "My CRM"
  @create_time = Time.new.strftime("%m-%d-%Y at %H:%M:%S")
  erb :index
end