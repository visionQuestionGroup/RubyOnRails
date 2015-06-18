class UsersController < ApplicationController
  def register
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.new(email: params[:email],
                     password: passhash)
    if @user.save
      render users.register.json.jbuilder, status: :created
      else 
        render @user.errors.full_messages.json.jbuilder,
        status: :unprocessable_entity
    end
  end
end
