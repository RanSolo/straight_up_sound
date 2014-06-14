class UserRecording < ActiveRecord::Base
  has_one :user
  belongs_to :recording
end
