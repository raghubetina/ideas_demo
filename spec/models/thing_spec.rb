require "rails_helper"

RSpec.describe Thing, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_uniqueness_of(:description) }

    it { should validate_presence_of(:description) }
  end
end
