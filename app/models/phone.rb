class Phone < ActiveRecord::Base
  attr_accessible :contact_id, :integer, :phonenumber
  belongs_to :contact
  validates :phonenumber, presence: true
end
