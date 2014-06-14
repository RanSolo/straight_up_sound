class UserSong < ActiveRecord::Base
  has_one :user
  belongs_to :song
end
