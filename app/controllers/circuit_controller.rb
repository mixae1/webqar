class CircuitsController < ApplicationController
  def index
    case params[:something]
    when
    ""
    when
    ""
    else
      render text: '404'
    end
    @private_circuits_list = PrivateCircuit.readonly.all
  end

  def new

  end

  def create

  end

  def show
    @circuit = PrivateCircuit.readonly.find(params[:id])
  end

  def edit

  end

  def update
    case params[:method]
    when :patch

    when :put

    else
      throw Exception.new
    end
  end

  def destroy

  end
end

