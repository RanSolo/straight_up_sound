require 'digest/md5'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: true,
            format: { with: /\A[a-zA-Z0-9]+\z/,
            message: "username can only contain letters and numbers"}

  has_many :user_songs
  has_many :songs, through: :user_songs
  has_many :user_recordings
  has_many :recordings, through: :user_recordings
  has_many :comments

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["username = :value OR lower(email) = lower(:value)",
      { :value => login }]).first
    else
      where(conditions).first
    end
  end
end
