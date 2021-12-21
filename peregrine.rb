require "roda"

require_relative './lib/actor'

class Peregrine < Roda
  plugin :json, classes: [Array, Hash]
  plugin :public

  class RodaRequest
    def with_param(name, &block)
      return unless params.key? name
      on(&block)
    end
  end

  route do |r|
    r.public

    r.root do
      r.with_param "actor" do
        Actor.find(name: r.params['actor'])
        {:films=>[]}
      end

      response.status = 404
      { error: 'actor or film required' }
    end
  end
end
