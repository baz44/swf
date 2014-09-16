Routing.routes do
  route("/hello") do
    "Hello #{params['name'] || "World"}!"
  end

  route("/goodbye") do
    [500, {}, "Lol, goodbye!"]
  end

  route("/lol") do
    ::HelloLolResponse.new(params).response
  end

  route("/json") do
    ::HelloShowResponse.new(params, :json).response
  end
end
