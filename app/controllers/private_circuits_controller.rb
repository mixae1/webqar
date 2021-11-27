class PrivateCircuitsController < ApplicationController
  def index
    @private_circuits_list = PrivateCircuit.readonly.where(['user_id = ?', current_user.id])
  end

  def new

  end

  def create

  end

  def show
    @circuit = PrivateCircuit.readonly.find(params[:id]);
  end

  def edit

  end

  def update
    case [:method]
    when :patch

    when :put

    else
      throw Exception.new
    end
  end

  def destroy

  end
end
