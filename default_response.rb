class DefaultResponse
  def initialize(params, response_type = :html, status=200, headers={})
    @params = params
    @status = status
    @headers = headers
    @response_type = response_type
  end

  def params
    @params
  end

  def body
    @body || ""
  end

  def status
    @stauts || 200
  end

  def headers
    @headers.merge!({"Content-Type" => response_type})
  end

  def response_type
    case @response_type
    when :html
      "text/html"
    when :json
      "application/json"
    end
  end

  def response
    [status, headers, body]
  end
end
