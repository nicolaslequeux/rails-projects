class StoriesController < ApplicationController

  before_action :ensure_login, only: [:new, :create]

  def index
    #@current_time = Time.now
    # @story = Story.first
    # @stories = Story.where('votes_count >= 5').order('id DESC')

    #@stories = fetch_stories 'votes_count >= 5'
    # Après creation "scope" la methode "fetch_stories" devient inutile!
    @stories = Story.popular
  end

  def new
    @story = Story.new
  end

  def create
    ### Memo@story = Story.new(params[:story].permit!)
    #@story = Story.new(story_params) ##Should be
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
    console
    @story = Story.find(params[:id])
  end

  def bin
    # @stories = fetch_stories("votes_count < 5")
    @stories = Story.upcoming
    render action: "index"
  end

  private

  def story_params
    params.require(:story).permit(:name, :link, :description, :tag_list)
  end

  # def fetch_stories(condition)
  #   @stories = Story.where(condition).order("id DESC")
  # end

end
