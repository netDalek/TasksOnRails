class UsersController < ApplicationController
  skip_before_filter :authorize, :only => [:create, :new]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User created"
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end
end
