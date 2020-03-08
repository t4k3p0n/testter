class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login, :top]}

  def top
  end

  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/index")
    else
      render("users/new")
    end
  end

  def loign_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def guest
    @user = User.find_by(email: 'poyon1104@yahoo.co.jp', password_digest: '$2a$12$EXt/33mSzew11vxVPE.Hlu1mWqxqzyOBLbyKJZTmA0FzuwRaEMjZ.')
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/index")
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/users/login_form")
  end

end
