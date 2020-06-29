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

# update
# # IDを指定して値を更新したい時
# User.update(1,age: 50)
# # 更新対象をwhereで探す場合
# User.where(name: "tanaka").update(age:60)
# # 複数のフィールドを変える場合
# User.where(name: "tanaka").update(age:70, name:"taguchi")
# # 複数のレコードを更新する場合
# User.where("age >= 20").update(age:80)

# update_all
User.where("age >= 20").update_all("age = age + 2")
pp User.select("id, name, age").all

