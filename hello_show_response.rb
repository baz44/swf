require 'default_response'

class HelloShowResponse < DefaultResponse
  def body
    {a: "a", b: "b"}.to_json
  end
end

require 'erb'

class HelloLolResponse < DefaultResponse
  def body
    @lol = "lol"
    ERB.new(File.read('views/template.erb')).result(binding)
  end
end
