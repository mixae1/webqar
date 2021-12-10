class CircuitsController < ApplicationController
  before_action :authenticate_user!, except: %i[public show]
  before_action :set_circuit, only: %i[publish unpublish edit]
  before_action :set_safe_circuit, only: %i[show]

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

  end

  def publish
    @circuit.published = true
    @circuit.save
  end

  def show

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

  def unpublish
    @circuit.published = false
    @circuit.save
  end

  private

  def set_safe_circuit
    @circuit = Circuit.readonly.find_by_id(params[:id])
    render_404 unless @circuit
  end

  def set_circuit
    @circuit = Circuit.find_by_id(params[:id])
    render_404 unless @circuit
  end
end
