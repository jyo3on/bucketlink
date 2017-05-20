class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @item }
    end
  end

  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @item }
    end
  end

  def create
    @item = Item.new(item_params)
    uploader = ImgUploader.new
    uploader.store!(params[:img])
    uploader.retrieve_from_store!('my_file.png')

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

  private

  def item_params
    params.require(:item).permit(:title, :img, :content)
  end

end
