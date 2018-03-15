require 'httparty'
require 'pubg_rb/json_gzip_parser.rb'

require "pubg_rb/version"
require "pubg_rb/status"
require "pubg_rb/client"

module PUBG
  # Alias to PUBG::Client.new
  #
  # Usage:
  #   client = PUBG.new(api_token: '097cd31f3a08fef202b3eefd18853d69', platform: 'xbox', region: 'na')  
  def self.new(options={})
    PUBG::Client.new(options)
  end

  # This doesn't serve a huge purpose, but is a reminder of the currently defined shards as published by Bluehole.
  # https://developer.playbattlegrounds.com/docs/en/making-requests.html#regions
  # Updated: 3/14/2018 @ 1:57PM EST
  def self.shards
    {
      xbox: { as: 'Asia', eu: 'Europe', na: 'North America', oc: 'Oceania' },
      pc: { krjp: 'Korea/Japan', na: 'North America', eu: 'Europe', oc: 'Oceania', kakao: 'Kakao', sea: "South East Asia", sa: "South/Central America", as: 'Asia' }
    }
  end
end
