class User < ApplicationRecord
  # Direct associations

  belongs_to :age_group

  belongs_to :density

  belongs_to :porosity

  belongs_to :curl_pattern

  has_many   :reviews,
             :dependent => :destroy

  # Indirect associations

  has_many   :products,
             :through => :reviews,
             :source => :product

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
