require 'rails_helper'

RSpec.describe "things#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/things/#{thing.id}"
  end

  describe 'basic destroy' do
    let!(:thing) { create(:thing) }

    it 'updates the resource' do
      expect(ThingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Thing.count }.by(-1)
      expect { thing.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
