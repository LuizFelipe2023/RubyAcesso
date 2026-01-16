class UsersController < ApplicationController
  before_action :require_admin!
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all

    
    if params[:query].present?
      @users = @users.where("email_address LIKE ?", "%#{params[:query]}%")
    end

    if params[:is_admin].present?
      @users = @users.where(isAdmin: params[:is_admin] == "true")
    end

    @users = @users
              .order(created_at: :desc)
              .page(params[:page])
              .per(5)
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: "Usuário criado com sucesso"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    params_to_update =
      if params[:user][:password].present?
        user_params
      else
        params.require(:user).permit(:email_address, :isAdmin)
      end

    if @user.update(params_to_update)
      redirect_to @user, notice: "Usuário atualizado com sucesso"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @user == current_user
      redirect_to users_path, alert: "Você não pode remover seu próprio usuário"
      return
    end

    @user.destroy
    redirect_to users_path, notice: "Usuário removido com sucesso"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user)
          .permit(:email_address, :password, :password_confirmation, :isAdmin)
  end
end
