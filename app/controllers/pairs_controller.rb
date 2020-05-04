class PairsController < ApplicationController
  before_action :authenticaton_required
  # before_action :logged_in?
  def new
  end

  def index
    @pairs = Pair.all
    @open_pairs = Pair.by_status(:open)
  end

  def show
    @pair = Pair.find_by(id: params[:id])
  end

  def update
    @pair = Pair.find_by(id: params[:id])
    # if @pair.update(respondor_user: current_user)
    if @pair.accepted_by(current_user)
      redirect_to @pair
    else
      render :new
    end
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
