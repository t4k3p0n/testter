class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login, :top]}
  before_action :ensure_correct_user,{only: [:destroy]}

  def top
  end

  def index
    @users = User.all
    @posts = @current_user.posts.all

  end
  
 

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.all
  end
  
  def new
    @user = User.new
  end

  def posts
    return Post.where(user_id: self.id)
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(status:"完了")
    redirect_to("/users/index")
  end

def photoch
@user = User.find_by(id: params[:id])
if params[:image]
    @user.image_name = "#{@user.id}.jpg"
    image = params[:image]
    File.binwrite("public/user_images/#{@user.image_name}", image.read)
    @user.save!
    redirect_to("/users/#{@user.id}")
  end
end
 
def change
  @user = User.find_by(id: params[:id])
  @posts = @user.posts.all
  @user.name = params[:name1]
  @user.email = params[:email2]
  @user.profile = params[:prf]

  

  if @user.save
    redirect_to("/users/#{@user.id}")
  else
    render("users/show")
  end
end
  def tasks
    @post = Post.new(content: params[:content], user_id: @current_user.id ,status:"進行中")
    @post.save
    redirect_to("/users/index")
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/users/index")
  end

  def create 
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "default_user.jpg"
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/index")
    else
      @error_message = "メールアドレス、名前、パスワードのどれかが入力できていません"
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
    @user = User.find_by(email: 'poyon1104@yahoo.co.jp', password_digest: '$2a$12$S3YXxdTAaf0oryLad3kS/OtXQo7TOjIAoOtGriJECONR/kDgBMFfO')
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/index")
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/users/login_form")
  end

def ensure_correct_user
  @post = Post.find_by(id: params[:id])
  if @post.user_id != @current_user.id
  flash[:notice] = "権限がありません"
  redirect_to("/posts/index")
end
end
end
