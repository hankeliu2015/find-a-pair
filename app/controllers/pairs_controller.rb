class PairsController < ApplicationController
  before_action :authenticaton_required
  # before_action :logged_in?
  def new
  end

  def index
    @pairs = Pair.all
  end

  def create
    @pair = Pair.create(topic: params[:Topic], requestor_user_id: current_user.id)
    # @pair.requestor_user_id = current_user.id
    if @pair
      redirect_to "/pairs"
    else
      raise @pair.errors.inspect
    end
  end


end
