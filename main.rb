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

# # insert
# DBへの登録するための記述
user = User.new
user.name = "tanaka"
user.age = 23
user.save

# ロケット
user = User.new(:name => "hayashi", :age => 25)
user.save

# createを使うとnewとsaveは同時にできる
user = User.create(name: "nakamura", age: 26)

