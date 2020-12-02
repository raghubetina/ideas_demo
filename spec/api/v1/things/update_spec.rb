require 'rails_helper'

RSpec.describe "things#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/things/#{thing.id}", payload
  end

  describe 'basic update' do
    let!(:thing) { create(:thing) }

    let(:payload) do
      {
        data: {
          id: thing.id.to_s,
          type: 'things',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ThingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { thing.reload.attributes }
    end
  end
end
