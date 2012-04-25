require 'sinatra'

get '/hi' do
  "Hello World!"
end

get '/authorized' do
# should return the URL to which Creatary should redirect
  if params['user'] == nil || params['session'] == nil
    "Missing params"
  end
end

get 'denied' do
# should return the URL to which Creatary should redirect

end

get 'receive_sms' do
  # |from_user, to_app, body|
      
end

get '/lifecycle_notification' do
  # |channel, invoker, reason, application_name, notification_type, access_tokens|

end