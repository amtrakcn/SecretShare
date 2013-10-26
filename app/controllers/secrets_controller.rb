class SecretsController < ApplicationController
  def new
    @secret = Secret.new(:recipient_id => params[:user_id])
    render :new
  end

  def create
    @secret = current_user.authored_secrets.build(params[:secret])

    if @secret.save
      tags = @secret.tags.map { |tag| tag.name }
      render :json => { data: [@secret, tags] }
    else
      render :json => { errors: @secret.errors.full_messages }
    end
  end
end