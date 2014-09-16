$:.unshift File.dirname(__FILE__)

require 'rack'
require 'routing'

class Application
  def initialize
    Routing.add_routes
    Rack::Handler::WEBrick.run Application.app
  end

  def self.app
    @app ||= begin
      Rack::Builder.new do
        map "/" do
          run ->(env) {[404, {'Content-Type' => 'text/plain'}, ['Page Not Found!']] }
        end
      end
    end
  end
end


