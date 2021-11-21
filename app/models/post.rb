class Post < ApplicationRecord
  attr_accessor :title,
                :text,
                :created_at,
                :updated_at

  belongs_to :user
end
