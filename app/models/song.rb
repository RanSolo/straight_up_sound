class Song < ActiveRecord::Base
  require 'carrierwave'
  acts_as_commentable
  belongs_to :user_song
  has_many :recordings
  has_many :comments, foreign_key: 'commentable_id'

end
