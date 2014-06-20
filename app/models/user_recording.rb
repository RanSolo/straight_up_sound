class UserRecording < ActiveRecord::Base
  belongs_to :user
  belongs_to :recording
end
