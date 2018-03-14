require_relative "matches"
require_relative "telemetry"

module PUBG
  class Client
    # Include HTTParty Module
    include HTTParty
    # Format HTTP response automatically to JSON
    format :json

    include Matches
    include Telemetry

    attr_reader :api_token, :platform, :region, :headers

    # Initialize the PUBG::API.client with a valid API token
    #
    # Usage:
    #   client = PUBG::Client.new(api_token: '097cd31f3a08fef202b3eefd18853d69', platform: 'xbox', region: 'as')
    #
    # Arguments:
    #   api_token: (String)
    #
    # Returns:
    #   PUBG::Client object
    #
    def initialize(options={})
      @api_token = options[:api_token] || nil
      @platform  = options[:platform]  || nil
      @region    = options[:region]    || nil

      auth_token = @api_token.nil? ? '' : "Bearer #{@api_token}"
      @headers = { 'Authorization' => auth_token, 'Accept-Encoding' => 'gzip, deflate', 'Accept' => 'application/vnd.api+json' }

      # Grab our shards url fragment to setup the base_uri
      if @platform.nil? || @region.nil?
        # Raise error if either of these aren't present.
        raise ArgumentError, "Requires both a platform and region."
      else
        shard = shard_select(@platform, @region)
        # Set the base URI to pass back up to httparty
        self.class.base_uri "https://api.playbattlegrounds.com/#{shard}"
      end
    end

    # Monkeypatch get method to include headers by default.
    def get(path)
      self.class.get(path, @headers)
    end

    private 

    # Build shard URL fragment
    def shard_select(platform, region)
      "shards/#{platform}-#{region}/"
    end

  end
end
