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

  context 'with an actor' do
    before { get '/', actor: 'Macaulay_Culkin' }

    fit "returns list of films" do
      expect(last_response.status).to eq(200)

      expect(
        returned_json['films']
      ).to eq macaulays_films
    end

    let(:macaulays_films) do
      [
        "Home Alone",
        "Saved!",
        "The Pagemaster",
        "The Wrong Ferarri",
        "Party Monster (2003 film)",
        "Home Alone 2: Lost in New York",
        "Wish Kid",
        "Adam Green's Aladdin",
        "Sex and Breakfast",
        "My Girl (film)",
        "Richie Rich (film)"
      ]
    end
  end

  def returned_json
    JSON.parse(last_response.body)
  end
end
