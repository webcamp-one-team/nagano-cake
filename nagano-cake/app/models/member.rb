class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
#上記active_for_authentication?について。
#superは記載があるクラスの親クラス(スーパークラス)で定義されたメソッドをすべてそのまま子クラス(サブクラス)で使えるようにするメソッド。(例えばここで言えばmemberクラスが子。applicationRecordクラスが親。 )
#先生曰くsuper側に書いてあることまでは考えなくてよいとのこと。githubで「active_for_authentication?」メソッドが存在するはずなので調べれば記載はあるはずだけどかなり時間がかるとのこと。
#&&は左辺と右辺がtrueならtrueを返す演算子。左辺はdevise側によって設定されたsessionコントローラー(このメソッドはsessionコントローラーで使うため)のメソッドが入る。
#定義したメソッドは「インスタンス変数.メソッド」という使い方しかしない。単体で置かれることはないのでインスタンス変数(self.is_deleted == false)。
#つまりインスタンス変数に入っているmemberのis_deletedカラムがfalseならtrueを返し、カラムがtrueならfalseを返す。
#左辺がtrueで右辺がtrueならtrueを、それ以外の組み合わせならfalseを返す。

  has_many :addresses
  has_many :carts
  has_many :orders
  has_many :cart_items
  has_many :items, through: :cart_items


end

