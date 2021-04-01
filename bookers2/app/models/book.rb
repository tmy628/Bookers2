class Book < ApplicationRecord

   belongs_to :user
   # belongs_toは、bookモデルからuser_idに関連付けられていて、Userモデルを参照することができる
   # bookモデルに関連付けられるのは、1つのUserモデルのみ → 単数形の「user」になっている

   validates :title,
     presence: true
   validates :body,
     presence: true, length: { maximum: 200 }
     # 文字数の制限を設ける→length 長さの下限を200文字に設定→minimum
     # presence: trueは、空欄でないことを確認している
end
