class CreataryHandler
 
  def authorized(user, session)
    # should return the URL to which Creatary should redirect
  end

  def denied(session)
    # should return the URL to which Creatary should redirect
  end

  def receive_sms(from_user, to_app, body, transaction_id)
    LOGGER.info 'receive_sms from user: ' + from_user + ' ,to app: ' + to_app + ' , body:' + body
  end

  def lifecycle_notification(channel, invoker, reason, application_name, notification_type, access_tokens)
  end

end