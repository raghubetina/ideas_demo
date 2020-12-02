class Thing < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :description, uniqueness: true

  validates :description, presence: true

  # Scopes

  def to_s
    description
  end
end
