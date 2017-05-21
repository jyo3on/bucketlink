class BucketsController < ApplicationController
  def index
    @items = Item.all
    @myitems = @items.where(user_id: current_user.id)
  end
end
