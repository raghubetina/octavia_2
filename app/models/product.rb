class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :product_category

  has_many   :reviews,
             :dependent => :destroy

  has_many   :ingredients,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :reviews,
             :source => :user

  has_many   :substances,
             :through => :ingredients,
             :source => :substance

  has_many   :densities,
             :through => :users,
             :source => :density

  has_many   :porosities,
             :through => :users,
             :source => :porosity

  has_many   :curl_patterns,
             :through => :users,
             :source => :curl_pattern

  # Validations

end
