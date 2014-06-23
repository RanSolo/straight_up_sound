class Recording < ActiveRecord::Base
  acts_as_commentable
  belongs_to :song
  has_many :comments, foreign_key: 'commentable_id'
  has_many :user_recordings
  has_many :users, through: :user_recording
  validates :name, presence: true
  mount_uploader :file, FileUploader
end
