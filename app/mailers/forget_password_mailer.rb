# encoding: utf-8
class ForgetPasswordMailer < ActionMailer::Base
  default from: "service@wine100.org"

  def forgot(user)
  	  subject = "Wine100: 重置密码"
  	  @user = user
  	  @token = user.fogot_password_token
  	  mail(:to => user.email, :subject => subject)
  end
end
