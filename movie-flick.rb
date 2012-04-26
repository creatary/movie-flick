require 'sinatra/base'

class MovieFlick < Sinatra::Base
  
  get "/hi" do
    "Hello World"
  end
  
end

class CreataryHandler
  def authorized(user, session)
    # should return the URL to which Creatary should redirect
  end

  def denied(session)
    # should return the URL to which Creatary should redirect
  end

  def receive_sms(from_user, to_app, body, transaction_id)
    Creatary::API.send_sms(to_app, from_user, "hello world", transaction_id)
  end

  def lifecycle_notification(channel, invoker, reason, application_name, notification_type, access_tokens)
  end
end

#MovieFlick.run!