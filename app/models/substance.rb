class Substance < ApplicationRecord
  # Direct associations

  has_many   :ingredients,
             :dependent => :destroy

  # Indirect associations

  has_many   :products,
             :through => :ingredients,
             :source => :product

  # Validations

end
