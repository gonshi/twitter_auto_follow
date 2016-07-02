require "twitter"

# search twitter
twitter_client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['GET_FOLLOWER_TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['GET_FOLLOWER_TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['GET_FOLLOWER_TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['GET_FOLLOWER_TWITTER_ACCESS_TOKEN_SECRET']
end

followers = twitter_client.followers(ARGV[0])

followers.take(15).each_with_index do |follower, i|
  twitter_client.follow(follower.id)
end
