require 'active_support/all'
require "active_record"
# ppはプリティープリント、オブジェクトをわかりやすく表現するrubyのライブラリ
require 'pp'

# 時間の設定、決まり文句ぐらいで覚える
Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

# DBの読み込み
ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./myapp.db"
)

class User < ActiveRecord::Base
end

User.delete_all

User.create(name:"tanaka", age:19)
User.create(name:"takahashi", age:12)
User.create(name:"murata", age:24)
User.create(name:"suzuki", age:77)
User.create(name:"okazaki", age:10)

# IDを指定してレコード抽出する方法
pp User.select("id, name, age").find(3)

# 別のフィールドで抽出する方法
pp User.select("id, name, age").find_by(name:"tanaka")

# # 引数の（）をrubyは外せる
pp User.select("id, name, age").find_by name:"tanaka"

# # find_byの後にカラム名を繋げられる　例:find_by_name "tanaka"
pp User.select("id, name, age").find_by_name "tanaka"

# # 値は（）をつけてもよし
pp User.select("id, name, age").find_by_name("tanaka")

# 存在しない値を探した時、エラーを返す場合は命令に!をつける
pp User.select("id, name, age").find_by_name!("kirya")