class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :surname
  validates :email, presence: true, uniqueness: true

  validates :password, presence:true, length: {:within => 6..100}, :allow_blank => false
  before_save :encrypt, if: :password_changed?
  validates_confirmation_of :password, message: 'NOT_MATCHED'
  attr_accessor :password_confirmation

  enum role: [:ceo]

  has_one :company, dependent: :destroy

  SALT = ENV.fetch("PASSWORD_SALT")

  def self.encrypt_password(password)
    return Digest::SHA256.hexdigest(password + SALT)
  end

  def encrypt
    self.password = User.encrypt_password(self.password) if self.password
  end

  def as_json(options={})
    res = super(options)

    res.delete('password')
    res
  end
end
