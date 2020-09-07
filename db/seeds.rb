# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#初期ユーザデータ　管理側
Admin.create!(:email => 'j@j', :password => 'jjjjjj')
Admin.create!(:email => 'k@k', :password => 'kkkkkk')
Admin.create!(:email => 'l@l', :password => 'llllll')

#初期ユーザデータ　会員側
Member.create!(:email => 'a@a', :password => 'aaaaaa', :last_name => '竈門', :last_name_kana => 'カマド', :first_name => '炭治郎', :first_name_kana => 'タンジロウ', :postal_code => '4180011', :address => '静岡県富士宮市粟倉地先', :telephone_number => '0120794889', :is_deleted => false)
Member.create!(:email => 'b@b', :password => 'bbbbbb', :last_name => '我妻', :last_name_kana => 'アガツマ', :first_name => '善逸', :first_name_kana => 'ゼンイツ', :postal_code => '1008111', :address => '東京都千代田区千代田1-1-1', :telephone_number => '33-3213-1111', :is_deleted => false)
Member.create!(:email => 'c@c', :password => 'cccccc', :last_name => '嘴平', :last_name_kana => 'ハジビラ', :first_name => '伊之助', :first_name_kana => 'イノスケ', :postal_code => '0000000', :address => 'その辺の山', :telephone_number => '99999999999', :is_deleted => false)