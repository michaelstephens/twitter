json.extract! tweet_reply, :id, :content, :user_id, :created_at, :updated_at
json.url tweet_reply_url(tweet_reply, format: :json)
