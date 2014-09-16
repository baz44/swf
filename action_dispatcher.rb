class ActionDispatcher
  attr_reader :headers, :body, :request

  def initialize(&block)
    @block = block
  end

  def params
    request.params
  end

  def body
    @body || ""
  end

  def status
    @status || 200
  end

  def headers
    @headers || {"Content-Type" => "text/html"}
  end

  def call(env)
    @request = Rack::Request.new(env)
    @status, @headers, @body = self.instance_eval(&@block)
    [status, headers, [body]]
  end
end
