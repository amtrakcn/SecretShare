class SecretsController < ApplicationController
  def new
    @secret = Secret.new(:recipient_id => params[:user_id])
    render :new
  end

  def create
    @secret = current_user.authored_secrets.build(params[:secret])

    if @secret.save
      render :json => @secret
    else
      render :json => @secret.errors.full_messages
    end
  end
end