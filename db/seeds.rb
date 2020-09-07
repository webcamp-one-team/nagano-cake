# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#初期管理者
Admin.create!(:email => 'j@j', :password => 'jjjjjj')
Admin.create!(:email => 'k@k', :password => 'kkkkkk')
Admin.create!(:email => 'l@l', :password => 'llllll')

#初期会員
Member.create!(:email => 'a@a', :password => 'aaaaaa', :last_name => '竈門', :last_name_kana => 'カマド', :first_name => '炭治郎', :first_name_kana => 'タンジロウ', :postal_code => '4180011', :address => '静岡県富士宮市粟倉地先', :telephone_number => '0120794889', :is_deleted => false)
Member.create!(:email => 'b@b', :password => 'bbbbbb', :last_name => '我妻', :last_name_kana => 'アガツマ', :first_name => '善逸', :first_name_kana => 'ゼンイツ', :postal_code => '1008111', :address => '東京都千代田区千代田1-1-1', :telephone_number => '33-3213-1111', :is_deleted => false)
Member.create!(:email => 'c@c', :password => 'cccccc', :last_name => '嘴平', :last_name_kana => 'ハシビラ', :first_name => '伊之助', :first_name_kana => 'イノスケ', :postal_code => '0000000', :address => 'その辺の山', :telephone_number => '99999999999', :is_deleted => true)

#初期ジャンル
Genre.create!(:name => 'ケーキ', :validity => true)
Genre.create!(:name => 'チョコレート', :validity => true)
Genre.create!(:name => '焼き菓子', :validity => false)
Genre.create!(:name => '和菓子', :validity => true)
Genre.create!(:name => 'アイス', :validity => true)
Genre.create!(:name => 'クレープ', :validity => true)

#初期アイテム
Item.create!(:name => 'ショートケーキ', :detail => 'とってもおいしいショートケーキです。ぜひ食べてみて！', :genre_id => 1, :price => 800, :is_active => true)
Item.create!(:name => 'チョコクランチ（おいしい）', :detail => '食べたら分かる。この美味しさ。', :genre_id => 2, :price => 1200, :is_active => true)
Item.create!(:name => 'チョコっとおいしいパン', :detail => '美味しさを噛み締めて味わって。', :genre_id => 2, :price => 400, :is_active => false)
Item.create!(:name => '焼き菓子のようななにか', :detail => '焼いてあるなにか。美味しい。', :genre_id => 3, :price => 20000, :is_active => true)
Item.create!(:name => '焼いたお菓子', :detail => '美味しいと評判のお菓子。', :genre_id => 3, :price => 1000, :is_active => false)