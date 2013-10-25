class SecretsController < ApplicationController
  def new
    @secret = Secret.new
    @user_id = params[:user_id]
    render :new
  end

  def create
    @secret = Secret.new(params[:secret])
    @secret.author_id = current_user.id

    if @secret.save
      render :json => @secret
    else
      flash[:error] = @secret.errors.full_messages
      redirect_to user_url(params[:secret][:recipient_id])
    end
  end
end
