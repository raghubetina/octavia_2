class Ingredient < ApplicationRecord
  # Direct associations

  belongs_to :substance

  belongs_to :product

  # Indirect associations

  # Validations

end
