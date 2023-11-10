class PostImagesController < ApplicationController
  
  def new
    # form_withに渡す空のインスタンス生成
    @post_image = PostImage.new
  end 
  
  def create
    # データを受け取り新規登録するためのインスタンス作成
    # form_withに入力された、postimageモデルに紐づくデータをグローバルインスタンスに代入
    @post_image = PostImage.new(post_image_params)
    # current_user.idでログイン中のユーザーのidを取得できる。
    # 投稿データのuser.idにcurrent.user.idをつける。
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else 
      render :new
    end 
  end 
  
  def index
    @post_images = PostImage.all
  end 
  
  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end 
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
