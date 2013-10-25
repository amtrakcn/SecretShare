class SecretsController < ApplicationController
  def new
    @secret = Secret.new(:recipient_id => params[:user_id])
    render :new
  end

  def create
    @secret = current_user.authored_secrets.build(params[:secret])

    if @secret.save
      redirect_to user_url(@secret.recipient_id)
    else
      flash.now[:errors] = @secret.errors.full_messages
      render :new
    end
  end
end