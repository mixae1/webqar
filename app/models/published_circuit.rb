class PublishedCircuit < ApplicationRecord
  attr_accessor :created_at,
                :updated_at

  has_one :private_circuit
end
