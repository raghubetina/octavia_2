class AgeGroup < ApplicationRecord
  # Direct associations

  has_many   :users,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
