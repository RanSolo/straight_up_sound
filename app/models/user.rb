require 'digest/md5'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, uniqueness: true


  has_many :user_songs
  has_many :songs, through: :user_songs
  has_many :user_recordings
  has_many :recordings, through: :user_recordings
  has_many :comments
end
