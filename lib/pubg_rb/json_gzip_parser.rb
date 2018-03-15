module PUBG
  class JsonGzipParser < HTTParty::Parser
    def json
      data = Zlib::GzipReader.new(StringIO.new(body)).read
      JSON.parse(data, :quirks_mode => true, :allow_nan => true)
    end
  end
end