class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, polymorphic: true, foreign_type: 'post_class'
end
