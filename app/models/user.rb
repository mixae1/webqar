class User < ApplicationRecord
  attr_accessor :email,
                :name,
                :password

  has_many :private_circuits, dependent: true
end
