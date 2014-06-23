class UserSong < ActiveRecord::Base
  acts_as_commentable

  belongs_to :user
  belongs_to :song
end
