class SecretsController < ApplicationController
  def new
    @secret = Secret.new
    render :new
  end

  def create
    @secret = Secret.new(params[:secret])
    @secret.author_id = current_user.id

    if @secret.save
      redirect_to user_url(current_user)
    else
    end
  end
end
