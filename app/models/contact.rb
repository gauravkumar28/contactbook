class Contact < ActiveRecord::Base
  has_many :emails, dependent: :destroy
  has_many :persons, dependent: :destroy
  has_many :phones, dependent: :destroy
end
