class ApplicationController < ActionController::Base
  #devise利用の機能（ユーザ登録、ログイン認証など）が使われる前に
  #configure_permitted_parametersメソッドが実行されます。
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  
  def configure_permitted_parameters
    #このメソッドは、devise_parameter_sanitizer.permitメソッドを使うことで
    #ユーザー登録(sign_up)の際に、ユーザー名(name)の
    #データ操作を許可しています。
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
