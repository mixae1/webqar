class PublishedCircuitsController < ApplicationController
  def index
    @mapping_puc_to_prc = {}
    published_circuits_list = PublishedCircuit.readonly.all
    published_circuits_list.each do |puc|
      @mapping_puc_to_prc[puc] = PrivateCircuit.readonly.find(puc.circuit_id)
    end
  end

  def show
    published_circuit = PublishedCircuit.readonly.find(params[:id])
    @circuit = PrivateCircuit.readonly.find(published_circuit.circuit_id)
    @author = User.find(@circuit.user_id).name
  end

  def add

  end
end
