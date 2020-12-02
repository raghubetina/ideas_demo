require "rails_helper"

RSpec.describe "things#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/things/#{thing.id}", params: params
  end

  describe "basic fetch" do
    let!(:thing) { create(:thing) }

    it "works" do
      expect(ThingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("things")
      expect(d.id).to eq(thing.id)
    end
  end
end
