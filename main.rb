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

# Where
# 値を絞って検索、20..29はrubyの範囲オブジェクト
# pp User.select("id, name, age").where(age:20..29)
# # 値を指定して検索
# pp User.select("id, name, age").where(age: [19,24])

# AND
# AND検索、条件を指定する方法
# pp User.select("id, name, age").where("age >= 20").where("age < 30")
# 同じ値ならこの書き方も可能
# pp User.select("id, name, age").where("age >= 20 and age < 30")

# OR
# OR検索
# pp User.select("id, name, age").where("age <= 20 or age >= 30")
# 別の書き方
# pp User.select("id, name, age").where("age <= 20").or(User.select("id, name,
#    age").where("age >= 30"))
# # さらに別の書き方
# pp User.where("age <= 20").or(User.where("age >= 30")).select("id, name, age")

# NOT
# NOT検索
pp User.select("id, name, age").where.not(id: 3)