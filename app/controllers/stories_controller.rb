class StoriesController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    @story = Story.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render xml: @story }
    end
  end
  def create
    @item = Item.find(params[:item_id])
    @story = @item.storys.new(story_params)

    respond_to do |format|
      if @story.save
        flash[:notice] = 'Story was successfully created.'
        format.html { redirect_to(@item) }
        format.xml  { render xml: @story, status: :created, location: @story }
      else
        format.html { render action: 'new' }
        format.xml  { render xml: @story.errors, status: :unprocessable_entity }
      end
    end
  end
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render xml: @item }
    end
  end

  private
  def story_params
    params.require(:story).permit(:title, :img, :content, :item_id)
  end
end

