require 'active_support/all'
require "active_record"
# ppはプリティープリント、オブジェクトをわかりやすく表現するrubyのライブラリ
require 'pp'
# どういったSQLが発行されているか確認するライブラリ？
require 'logger'

# 時間の設定、決まり文句ぐらいで覚える
Time.zone_default = Time.find_zone! 'Tokyo'
ActiveRecord::Base.default_timezone = :local

# 引数に出力先を書く
ActiveRecord::Base.logger = Logger.new(STDOUT)

# DBの読み込み
ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./myapp.db"
)

class User < ActiveRecord::Base
end

# insert
# ブロックを使ったインサート方法
user = User.new do |u|
  u.name = "sato"
  u.age = 19
end
user.save

