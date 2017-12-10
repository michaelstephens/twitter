class RepliesController < ApplicationController
  before_action :set_replies
  before_action :set_reply, only: [:show, :edit, :update, :destroy]

  # GET tweets/1/replies
  def index
    @replies = @tweet.replies.order('created_at DESC')
  end

  # GET tweets/1/replies/1
  def show
  end

  # GET tweets/1/replies/new
  def new
    @reply = @tweet.replies.build
  end

  # GET tweets/1/replies/1/edit
  def edit
    redirect_to root_path if @reply.user != current_user
  end

  # POST tweets/1/replies
  def create
    @reply = @tweet.replies.build(reply_params)
    @reply.user = current_user

    if @reply.save
      redirect_to tweet_replies_path(@tweet), notice: 'Reply was successfully created.'
    else
      render action: 'new'
    end
  end

  # PUT tweets/1/replies/1
  def update
    @reply.user = current_user
    if @reply.update_attributes(reply_params)
      redirect_to tweet_replies_path(@tweet), notice: 'Reply was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE tweets/1/replies/1
  def destroy
    @reply.destroy

    redirect_to tweet_replies_url(@tweet)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_replies
      @tweet = Tweet.find(params[:tweet_id])
    end

    def set_reply
      @reply = @tweet.replies.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def reply_params
      params.require(:reply).permit(:content, :user_id)
    end
end
