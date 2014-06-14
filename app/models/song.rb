class Song < ActiveRecord::Base
  belongs_to :user_song
  has_many :recordings
  has_many :comments, foreign_key: 'post_id'
end
