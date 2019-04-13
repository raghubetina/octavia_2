class Product < ApplicationRecord
  # Direct associations

  has_many   :ingredients,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
