class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    # @userに関連付けられた投稿すべて(.post_images)を取得し代入
    # 結果的に、全体の投稿ではなく、個人が投稿したものすべてを表示できる。
    # @post_image.userの対 => @post_imageに紐づいたユーザー情報の取得
    # @post_images = @user.post_images
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end 
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end 
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to post_images_path
    end 
  end 
  
end
