require 'test_helper'

class RepliesControllerTest < ActionController::TestCase
  setup do
    @tweet = tweets(:one)
    @reply = replies(:one)
  end

  test "should get index" do
    get :index, params: { tweet_id: @tweet }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { tweet_id: @tweet }
    assert_response :success
  end

  test "should create reply" do
    assert_difference('Reply.count') do
      post :create, params: { tweet_id: @tweet, reply: @reply.attributes }
    end

    assert_redirected_to tweet_reply_path(@tweet, Reply.last)
  end

  test "should show reply" do
    get :show, params: { tweet_id: @tweet, id: @reply }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { tweet_id: @tweet, id: @reply }
    assert_response :success
  end

  test "should update reply" do
    put :update, params: { tweet_id: @tweet, id: @reply, reply: @reply.attributes }
    assert_redirected_to tweet_reply_path(@tweet, Reply.last)
  end

  test "should destroy reply" do
    assert_difference('Reply.count', -1) do
      delete :destroy, params: { tweet_id: @tweet, id: @reply }
    end

    assert_redirected_to tweet_replies_path(@tweet)
  end
end
