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

min = 20
max = 30

pp User.select("id, name, age").where("age >= #{min} and age < #{max}") # NG!!

# 直接変数を代入指定はいけないので?を使ったプレースホルダーを使う。
pp User.select("id, name, age").where("age >= ? and age < ?", min,max)

# ハッシュで中身を渡す事も可能
pp User.select("id, name, age").where("age >= :min and age < :max", {min: min,max:max})

#LIKEを使ったプレースホルダーの使い方
pp User.select("id, name, age").where("name like?" ,"%i")