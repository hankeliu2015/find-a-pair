class PairsController < ApplicationController
  before_action :authenticaton_required
  # before_action :logged_in?
  def new
    @pair = Pair.new
  end

  def index
    @pairs = Pair.all
    @open_pairs = Pair.by_status(:open)
  end

  def show
    @pair = Pair.find_by(id: params[:id])
    # raise @pair.inspect
  end

  def update
    @pair = Pair.find_by(id: params[:id])
    # if @pair.update(respondor_user: current_user)
    # byebug
    if @pair.accepted_by(current_user)
      redirect_to @pair
    else
      render :show
    end
  end

  def create
    @pair = Pair.create(title: params[:title], description: params[:description], requestor_user_id: current_user.id)
    # @pair.requestor_user_id = current_user.id
    if @pair.save
      redirect_to "/pairs"
    else
      render :new
    end
  end


end
