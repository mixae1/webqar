class CircuitsController < ApplicationController
  before_action :authenticate_user!, except: %i[public show]
  before_action :set_circuit, only: %i[edit update show destroy]
  before_action :authorize_circuit, only: %i[edit update destroy]
  def index
    @private_circuits_list = Circuit.readonly.where(['user_id = ?', current_user.id])
  end

  def public
    @published_circuits_list = Circuit.readonly.where(['published = ?', true])
  end

  def new
    @circuit = Circuit.new
  end

  def create
    @circuit = current_user.circuits.create(circuit_from_params)
    return redirect_to new_circuit_path unless @circuit.valid?
    redirect_to circuits_path
  end

  def show

  end

  def edit

  end

  def update
    case params["_method"]
    when "patch"

    when "put"
      @circuit.published = circuit_from_params[:published]
      @circuit.save
    else
      render_404
    end
  end

  def destroy

  end

  private

  def set_circuit
    id = params.require(:id)
    @circuit = Circuit.find_by_id(id)
    render_404 unless @circuit
  end

  def circuit_from_params
    params.require(:circuit).permit(:title, :description, :scheme, :published)
  end

  def authorize_circuit
    render_404 unless current_user.id == @circuit&.user_id
  end
end
