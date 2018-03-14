module PUBG

  # The status endpoint can be called to verify that the API is up and running. It also provides the most recent release date and version of the API service itself.
  #
  # Usage: PUBG.status
  def self.status
    HTTParty.get('https://api.playbattlegrounds.com/status', {
      headers: {"Accept" => "application/vnd.api+json"}
    })
  end
end