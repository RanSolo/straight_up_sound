class Recording < ActiveRecord::Base
  belongs_to :song
  has_many :comments, foreign_key: 'post_id'
  has_many :user_recordings
  has_many :users, through: :user_recording
  validates :name, presence: true
  mount_uploader :file, FileUploader
end
