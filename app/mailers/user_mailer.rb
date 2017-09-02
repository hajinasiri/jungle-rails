class UserMailer < ApplicationMailer

  def payment_email(user, order)
    @user = user
    @order = order
    if @user
      mail(to: @user.email, subject: 'Your order id is #{@order.id}')
    end
  end
end
