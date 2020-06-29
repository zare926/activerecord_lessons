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
  # 通常のバリテーション
  validates :name, presence: true
  validates :age, presence: true
  # 繋げてかける
  validates :name,:age, presence: true
  # 文字数などの制限
  validates :name, length: { minimum: 3 }
end

User.delete_all

User.create(name:"tanaka", age:19)
User.create(name:"takahashi", age:12)
User.create(name:"murata", age:24)
User.create(name:"suzuki", age:77)
User.create(name:"okazaki", age:10)

# Validation

user = User.new(name: nil, age: nil)
# user.save!

# エラーコードをターミナルに出す場合
if !user.save
  pp user.errors.messages
end