require "twitter"

# search twitter
twitter_client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['GET_FOLLOWER_TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['GET_FOLLOWER_TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['GET_FOLLOWER_TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['GET_FOLLOWER_TWITTER_ACCESS_TOKEN_SECRET']
end

QUERY = "スロット"
result_tweets = twitter_client.search(
    QUERY,
    count: 15,
    result_type: "recent",
    exclude: "retweets",
    since_id: nil
  )

result_tweets.take(15).each_with_index do |tweet, i|
  twitter_client.follow(tweet.user.id)
end
