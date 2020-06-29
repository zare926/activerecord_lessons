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
  # class method
  # def self.top(num)
  #   select("id, name, age").order(:age).limit(num)
  # end
  # #scope
  # scope :top, ->(num) {select("id, name, age").order(:age).limit(num)}
end

User.delete_all

User.create(name:"tanaka", age:19)
User.create(name:"takahashi", age:12)
User.create(name:"murata", age:24)
User.create(name:"suzuki", age:77)
User.create(name:"okazaki", age:10)

# delete 単にレコードを削除するだけなので、高速
# delete 1件削除
User.delete(1)

# delete_all 全件削除
User.where("age >= 25").delete_all

# destory　関連するオブジェクトを考慮してくれたり、処理の前に自動処理などの加える事もできるので、高機能だが低速
# destroy 1件削除
# destory_all　全件削除

pp User.select("id, name, age").all