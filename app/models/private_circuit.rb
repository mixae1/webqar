class PrivateCircuit < ApplicationRecord

  belongs_to :user
  validates :user_id, presence: true
  has_one :published_circuit
end
