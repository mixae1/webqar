class PublishedCircuitsController < ApplicationController
  def index
    @mapping_puc_to_prc = {}
    published_circuits_list = PublishedCircuit.readonly.all
    published_circuits_list.each do |puc|
      @mapping_puc_to_prc[puc] = PrivateCircuit.readonly.find(puc.private_circuit_id)
    end
  end

  def show
    published_circuit = PublishedCircuit.readonly.find(params[:id])
    @circuit = PrivateCircuit.readonly.find(published_circuit.private_circuit_id)
  end

  def create

  end

  def destroy

  end
end
