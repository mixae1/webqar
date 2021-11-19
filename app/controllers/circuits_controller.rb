class CircuitsController < ActionController::Base
  def index

  end

  def new

  end

  def create

  end

  def show(id)

  end

  def edit(id)

  end

  def update(id)
    case verb
    when :patch

    when :put

    else
      throw Exception.new
    end
  end

  def destroy(id)

  end
end
