class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  has_many :addresses
  has_many :carts
  has_many :orders
  has_many :cart_items
  has_many :items, through: :cart_items
  has_many :likes, dependent: :destroy




  #validates :last_name, format: { with: /\A[^\p{katakana}\u{30fc}]+\z/ }
  #validates :first_name, format: { with: /\A[^\p{katakana}\u{30fc}]+\z/ }
  #validates :last_name_kana, format: { with: /\A[\p{katakana}\u{30fc}]+\z/ }
  #validates :first_name_kana, format: { with: /\A[\p{katakana}\u{30fc}]+\z/ }
  #validates :postal_code, format: { with: /\A\d{7}\z/}
  #validates :telephone_number, format: { with: /\A0\d{9,14}\z/}
  #validates :address, length: { minimum: 10, maximum: 100}
  validates :encrypted_password, length: { minimum: 5 }
  #オカタクメモ
  #→17～18行目はlast・first_name_kanaのカラムのデータが正規表現with以下の//の中身と一致するかを見ており一致しなければはじくというバリデーション。
  #/\A[\p{katakana}\u{30fc}]+\z/の両端の//この二文字はruby内で正規表現を記載する際にこの//の間に記載するのがルールとなっている。
  #\A=^・\z=$と同じ意味。^$は脆弱性があるので過去は使用されていたが現在では使われていない。
  #\p{katakana}はメタ文字の一種。これ一塊でuniコードの全角カタカナを表す。\u{30fc}これもまたメタ文字。これ一塊で長音譜、つまり伸ばし棒のーを意味する。
  #[\p{katakana}\u{30fc}]の両端の[]はこの中に含む文字のうちどれか1文字を表す。つまり全角カタカナ＋伸ばし棒ーのうちどれか１文字。「ア～ン＋伸ばし棒ー」のうち１文字になる。
  #+は直前の文字のうち最低一文字を意味する。
  #よってこのバリデーションは入力される文字の個数が最低１文字かつ最初から最後まで「ア～ン＋伸ばし棒ー」どれかが入るものと一致しないのであればはじくという意味。
  #15～16行目の^は[]の中で使うと否定に変わる。つまりカタカナと長音譜は含まないという意味。
  #20行目は\Aで頭に0が入る文字列かつ\dで数字のみを9~14文字の範囲で指定する文字列を意味する。
end
