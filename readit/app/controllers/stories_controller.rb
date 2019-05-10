class StoriesController < ApplicationController

  before_action :ensure_login, only: [:new, :create]

  def index
    @current_time = Time.now
    @story = Story.first
  end

  def new
    @story = Story.new
  end

  def create
    #@story = Story.new(params[:story].permit!)
    #@story = Story.new(story_params)
    @story = @current_user.stories.build story_params

    #if @story.valid?
    if @story.save
      flash[:notice] = 'Story submission succeeded'
      redirect_to stories_path
    else
      # flash[:notice] = 'Incorrect data'
      render action: 'new'
    end
  end

  def show
    @story = Story.find(params[:id])
  end


  private

  def story_params
    params.require(:story).permit(:name, :link)
  end

end
