class Thing < ApplicationRecord
  # Direct associations

  belongs_to :user

  # Indirect associations

  # Validations

  validates :description, uniqueness: true

  validates :description, presence: true

  # Scopes

  def to_s
    description
  end
end
