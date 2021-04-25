class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]

    def index
        search = params[:search].present? ? params[:search] : nil
        @users = if search
            User.search(search)
        else
            User.all
        end
        @users = User.where(id: @users.pluck(:id)).order("LOWER(last_name)").page(params[:page])
    end

    def show
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            flash[:notice] = "Your account was created!"
            redirect_to @user
        else
            flash[:alert] = @user.errors.full_messages.join(", ")
            render 'new'
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end 

end
