module PUBG::Matches

  # Find matches based on options passed to this method. If no options are passed, return 5 last matches from API
  #
  # Usage: matches = PUBG::Matches.matches(options)
  #
  # Options:
  #  offset: (Integer)
  #  limit: (Integer) 1-5
  #  sort: (String) ['createdAt', '-createdAt']
  #  created_at_start: (String) '2018-01-01T00:00:00Z'
  #  created_at_end: (String) '2018-01-01T00:00:00Z'
  #  player_ids: (String) ['player-1', 'player-2']
  #  game_mode: (String) ['squad']
  #
  def matches(options={})
    request = query_builder(options)
    self.get(request)
  end

  # Finds Single match via the supplied ID
  #
  # Usage: match = PUBG::Match(1337)
  #
  # Arguments: 
  #  id: (Integer)
  #
  def match(id)
    self.get("/matches/#{id}")
  end

  private 

  # Builds the query that will be passed to the #matches request, based on what options are supplied (if any)
  #
  def query_builder(options)
    parsed_options = []

    options.each do |key,value|
      case key
      when :offset
        parsed_options << "page[offset]=#{value}"
      when :limit
        parsed_options << "page[limit]=#{value}"
      when :sort
        parsed_options << "sort=#{value}"
      when :created_at_start
        parsed_options << "filter[createdAt-start]=#{value}"
      when :created_at_end
        parsed_options << "filter[createdAt-end]=#{value}"
      when :player_ids
        parsed_options << "filter[playerIds]=#{value.join(',')}"
      when :game_mode
        parsed_options << "filter[gameMode]=#{value}"
      end
    end

    if options.empty?
      "/matches"
    else
      queries = parsed_options.join("&")
      "/matches?#{queries}"
    end
  end
end