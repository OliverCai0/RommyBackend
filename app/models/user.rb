class User < ApplicationRecord
  has_secure_password
  has_many: :join_group_users
  has_many: :user_tokens
end
