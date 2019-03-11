# == Schema Information
#
# Table name: users
#
#  id                 :bigint(8)        not null, primary key
#  email              :string           default(""), not null, indexed
#  encrypted_password :string           default(""), not null
#  jti                :string           not null, indexed
#  first_name         :string
#  last_name          :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  role               :string
#

class User < ApplicationRecord
  devise :database_authenticatable

  enumeration :role

  validates :email, presence: true, uniqueness: true
  validates :jti, presence: true, uniqueness: true
end
