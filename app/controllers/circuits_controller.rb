class CircuitsController < ApplicationController
  before_action :authenticate_user!, except: %i[public show]
  def index
    @private_circuits_list = Circuit.readonly.where(['user_id = ?', current_user.id])
  end

  def public
    @published_circuits_list = Circuit.readonly.where(['published = ?', true])
  end

  def new

  end

  def create

  end

  def publish
    c = Circuit.find(params[:id])
    c.published = true
    c.save
  end

  def show
    @circuit = Circuit.readonly.find(params[:id]);
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
    c = Circuit.find(params[:id])
    c.published = false
    c.save
  end
end
