class ApplicationController < ActionController::Base
  #deviseの機能（ユーザ登録、ログイン認証など）が使われる前に
  #configure_permitted_parametersメソッドが実行されます。
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    #サインイン後にどこに遷移するかを設定
    #resourceという引数には、ログインを実行したモデルのデータ、
    #今回の場合はつまりログインしたUserのインスタンスが格納される。
    post_images_path
  end 
  
  def after_sign_out_path_for(resource)
    about_path
  end
  
  protected
  
  
  def configure_permitted_parameters
    #このメソッドは、devise_parameter_sanitizer.permitメソッドを使うことで
    #ユーザー登録(sign_up)の際に、ユーザー名(name)の
    #データ操作を許可しています。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
