require 'erb'
require 'JSON'

class HelloController
  def self.show(params)
    @lol = "lol"
    ERB.new(File.read('template.erb')).result(binding)
  end
end

