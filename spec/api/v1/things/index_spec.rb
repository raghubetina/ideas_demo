require "rails_helper"

RSpec.describe "things#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/things", params: params
  end

  describe "basic fetch" do
    let!(:thing1) { create(:thing) }
    let!(:thing2) { create(:thing) }

    it "works" do
      expect(ThingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["things"])
      expect(d.map(&:id)).to match_array([thing1.id, thing2.id])
    end
  end
end
