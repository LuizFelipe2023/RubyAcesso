class SignUpsController < ApplicationController
      allow_unauthenticated_access
      def new 
          @user = User.new
      end

      def create 
          @user = User.new(user_params)
          if @user.save
             redirect_to new_session_path, notice: "Usuário criado com sucesso. Por favor, faça login"
          else 
             render :new, status: :unprocessable_entity
          end
      end

      private 

      def user_params 
          params.require(:user).permit(:email_address, :password, :password_confirmation)
      end 
end
