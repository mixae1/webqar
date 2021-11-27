class Post < ApplicationRecord

  belongs_to :user, presence: true
end
