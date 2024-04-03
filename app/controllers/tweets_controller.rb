class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:show, :edit, :update, :destroy, :like, :dislike]

  def index
    @tweet = Tweet.new
    @tweets = Tweet.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json { render json: @tweets }
    end
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    respond_to do |format|
      if @tweet.save
        @tweets = Tweet.order(created_at: :desc)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.js
      else
        format.html { redirect_to root_path, notice: 'Tweet was not created.' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    respond_to do |format|
      format.js # render edit.js.erb
    end
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.js # render update.js.erb
      else
        format.js { render :edit}
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.js
    end
  end

  def like
    respond_to do |format|
      if @tweet.likes.create(user_id: current_user.id)
        format.js
      else
        format.html { redirect_to root_path }
      end
    end
  end

  def dislike
    @like = @tweet.likes.find_by(user_id: current_user.id)
    respond_to do |format|
      if @like
        @like.destroy
        format.js
      else
        format.html { redirect_to root_path }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:content, :user_id)
    end
end
