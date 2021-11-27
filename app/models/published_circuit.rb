class PublishedCircuit < ApplicationRecord

  belongs_to :private_circuit
  validates :private_circuit_id, presence: true
end
