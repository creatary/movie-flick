require 'sinatra'


from_user = ""
to_app = ""
body = ""

get '/hi' do
  "Hello World" 
end

get '/sms' do
  "from user: #{from_user}, to app: #{to_app}, body: #{body}" 
end

get '/creatary/authorized' do
# should return the URL to which Creatary should redirect
  if params['user'] == nil || params['session'] == nil
    "Missing params"
  else
    user = params['user']
  end
end

get '/creatary/denied' do
# should return the URL to which Creatary should redirect

end

get '/creatary/receive_sms' do
  from_user = params['from_user']
  from_user = params['to_app']
  from_user = params['body']
end

get '/creatary/lifecycle_notification' do
  # |channel, invoker, reason, application_name, notification_type, access_tokens|

end