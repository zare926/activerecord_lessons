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

# Association
# User -> Comments

class User < ActiveRecord::Base
  has_many :comments
end

class Comment < ActiveRecord::Base
  belongs_to :user
end

User.delete_all

User.create(name:"tanaka", age:19)
User.create(name:"takahashi", age:12)
User.create(name:"murata", age:24)
User.create(name:"suzuki", age:77)
User.create(name:"okazaki", age:10)

Comment.delete_all
Comment.create(user_id:1, body: "hello-1")
Comment.create(user_id:1, body: "hello-2")
Comment.create(user_id:2, body: "hello-3")

user = User.includes(:comments).find(1)

# pp user.comments

# user.comments.each do |c|
#   puts "#{user.name}: #{c.body}"
# end

comments = Comment.includes(:user).all
comments.each do |c|
  puts "#{c.body} by #{c.user.name}"
end