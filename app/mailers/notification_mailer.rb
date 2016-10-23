class NotificationMailer < ActionMailer::Base

  def new_private(topic_id)
    notifiable_users = User.notifiable_on_private
    return if notifiable_users.count == 0

    @topic = Topic.find(topic_id)
    @recipient = notifiable_users.first
    @bcc = notifiable_users.last(notifiable_users.count-1)
    mail(
      to: @recipient,
      bcc: @bcc,
      from: AppSettings['email.admin_email'],
      subject: "[#{AppSettings['settings.site_name']}] ##{@topic.id}-#{@topic.name}"
      )
  end

  def new_public(topic_id)
    notifiable_users = User.notifiable_on_public
    return if notifiable_users.count == 0

    @topic = Topic.find(topic_id)
    @recipient = notifiable_users.first
    @bcc = notifiable_users.last(notifiable_users.count-1)
    mail(
      to: @recipient,
      bcc: @bcc,
      from: AppSettings['email.admin_email'],
      subject: "[#{AppSettings['settings.site_name']}] ##{@topic.id}-#{@topic.name}"
      )
  end

  def new_reply(topic_id)
    notifiable_users = User.notifiable_on_reply
    return if notifiable_users.count == 0

    @topic = Topic.find(topic_id)
    @recipient = notifiable_users.first
    @bcc = notifiable_users.last(notifiable_users.count-1)
    mail(
      to: @recipient,
      bcc: @bcc,
      from: AppSettings['email.admin_email'],
      subject: "[#{AppSettings['settings.site_name']}] ##{@topic.id}-#{@topic.name}"
      )
  end

end
