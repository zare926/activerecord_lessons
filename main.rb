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

# find_or_create_by

# 登録されているユーザーの場合は参照できる
# user = User.find_or_create_by(name:"takahashi")
# pp user

# 登録されていないユーザーの場合は登録されるが、検索した値以外はnilになる
# user = User.find_or_create_by(name:"yokota")
# pp user

# 検索した値以外を入力する場合はブロックを使う
user = User.find_or_create_by(name:"yokota") do |u|
  u.age = 18
end
pp user

