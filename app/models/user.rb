class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :tweets
  has_many :replies

  def name
    "#{first_name} #{last_name}"
  end

  def to_s
    name
  end

  def formatted_username
    "@#{username}"
  end
end
