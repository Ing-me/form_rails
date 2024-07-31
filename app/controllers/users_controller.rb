class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
         # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        @user = User.new(user_params)
        if @user.save
            redirect_to new_user_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show 
        @user = User.find(params[:id])

    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find_by(id: params[:id])
        if @user.update(user_params)
            flash[:notice] = 'User updated'
            redirect_to new_user_path
        else
            flash[:error] = "Fail to edit product!"
            render :edit, status: :unprocessable_entity
        end
    end

    private 

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end
end
