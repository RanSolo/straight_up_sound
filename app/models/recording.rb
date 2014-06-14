class Recording < ActiveRecord::Base
  belongs_to :song
  has_many :comments, foreign_key: 'post_id'

end
