class CurlPattern < ApplicationRecord
  # Direct associations

  has_many   :users,
             :dependent => :destroy

  # Indirect associations

  has_many   :products,
             :through => :users,
             :source => :products

  # Validations

end
