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

# レコードをすべて抽出
pp User.all
# 表示したいレコードを選択することが可能
pp User.select("id, name, age").all
# # 最初のレコードを抽出する方法
pp User.select("id, name, age").first
# 最後のレコードを抽出する方法
pp User.select("id, name, age").last
# 最初の3件を抽出する方法
pp User.select("id, name, age").first(3)