class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @userに関連付けられた投稿すべて(.post_images)を取得し代入
    # 結果的に、全体の投稿ではなく、個人が投稿したものすべてを表示できる。
    # @post_image.userの対 => @post_imageに紐づいたユーザー情報の取得
    @post_images = @user.post_images
  end

  def edit
    @usr = User.find(params[:id])
  end
end
