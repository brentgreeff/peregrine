require "roda"

class Peregrine < Roda
  plugin :json, classes: [Array, Hash]
  plugin :public

  route do |r|
    r.public

    r.root do

      response.status = 404
      { error: 'actor or film required' }
    end
  end
end
