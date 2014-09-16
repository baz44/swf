require 'application'
require 'action_dispatcher'

module Routing
  def self.route(pattern, &block)
    Application.app.map(pattern) do
      run ActionDispatcher.new(&block)
    end
  end

  def self.routes(&block)
    block.call
  end

  def self.add_routes
    f = File.open('routes.rb', 'r')
    eval(f.read)
  end
end

