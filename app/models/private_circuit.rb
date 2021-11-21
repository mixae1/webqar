class PrivateCircuit < ApplicationRecord
  attr_accessor :name,
                :description,
                :scheme,
                :created_at,
                :updated_at

  belongs_to :user
end
