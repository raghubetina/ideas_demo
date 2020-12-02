require "rails_helper"

RSpec.describe ThingResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "things",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ThingResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      end.to change { Thing.count }.by(1)
    end
  end

  describe "updating" do
    let!(:thing) { create(:thing) }

    let(:payload) do
      {
        data: {
          id: thing.id.to_s,
          type: "things",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ThingResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { thing.reload.updated_at }
      # .and change { thing.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:thing) { create(:thing) }

    let(:instance) do
      ThingResource.find(id: thing.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Thing.count }.by(-1)
    end
  end
end
