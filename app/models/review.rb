class Review < ApplicationRecord
  # Direct associations

  belongs_to :product

  belongs_to :user

  # Indirect associations

  # Validations

end
