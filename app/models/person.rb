class Person < ActiveRecord::Base
  attr_accessible :contact_id, :integer, :name
  validates :name, presence: true
  belongs_to :contact
end
