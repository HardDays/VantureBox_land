class UsersController < ApplicationController
  swagger_controller :user, 'User'

  # POST /users
  swagger_api :create do
    summary "Create user"
    param :form, :name, :string, :required, "User name"
    param :form, :surname, :string, :required, "User surname"
    param :form, :email, :string, :required, "User email"
    param :form, :phone, :string, :optional, "User phone"
    param :form, :password, :string, :required, "User password"
    param :form, :password_confirmation, :string, :required, "User password confirmation"
    param_list :form, :role, :string, :required, "User role", [:ceo]
    param :form, :goals, :string, :optional, "User goals"
    response :created
    response :unprocessable_entity
  end
  def create
    # User.transaction do
      @user = User.new(user_params)

      if @user.save
        token = AuthenticationHelper.process_token(request, @user)

        user = @user.as_json
        user["token"] = token.token
        render json: user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  # rescue
  #   render json: {errors: :FAILED_SAVE_USER}, status: :unprocessable_entity
  end

  private
    def user_params
      params.permit(:role, :name, :surname, :email, :phone, :password, :password_confirmation, :old_password, :goals)
    end
end
