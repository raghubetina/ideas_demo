require 'rails_helper'

RSpec.describe "things#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/things", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'things',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ThingResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Thing.count }.by(1)
    end
  end
end