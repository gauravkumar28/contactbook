class Email < ActiveRecord::Base
  attr_accessible :contact_id, :email_url, :integer
  validates :email_url, presence: true
  validates_format_of :email_url, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  belongs_to :contact
end
