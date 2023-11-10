class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_image
  
  # scopeがないと一番最初に誰かがいいねをしたらほかの人はできなくなる。
  #scopeで指定した引数は、同じデータは1件しか作成できなくなる
  # ここではpost_image_idスコープ内で、user_idカラムの値が重複しなくなる。
  # 投稿された画像のいいねに同じuser_idは一つしか存在しないことになる。
  validates :user_id, uniqueness: {scope: :post_image_id}
end
