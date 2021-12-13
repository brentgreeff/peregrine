# frozen_string_literal: true

RSpec.describe "Peregrine", type: :request do

  context 'without an actor or film' do
    before { get '/' }

    it "returns 404" do
      expect(last_response.status).to eq(404)

      expect(
        returned_json['error']
      ).to match %r{actor or film required}
    end
  end

  def returned_json
    JSON.parse(last_response.body)
  end
end
