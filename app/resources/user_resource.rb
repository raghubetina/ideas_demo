class UserResource < ApplicationResource
  secondary_endpoint "/current_user", [:show]
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string

  # Direct associations

  has_many :things

  # Indirect associations
end
