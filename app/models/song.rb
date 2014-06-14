class Song < ActiveRecord::Base
  belongs_to :user_song
  has_many :recordings
end
