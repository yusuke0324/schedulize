class User < ApplicationRecord
authenticates_with_sorcery!

PHASES = [1, 2, 3]

has_many :feedbacks
has_many :slots
has_many :appointments


validates :username, presence: true, uniqueness: {message: "%{value} has already been taken"}
validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

validates :email, uniqueness: {message: "%{value} has already been taken."}, presence: true
end
