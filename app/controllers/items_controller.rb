class ItemsController < ApplicationController
  def new
     @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @item }
    end
  end
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        flash[:notice] = 'Item was successfully created.'
        format.html { redirect_to(@item) }
        format.xml  { render xml: @item, status: :created, location: @item }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  def item_params
    params.require(:item).permit(:title, :img, :content)
  end
end
