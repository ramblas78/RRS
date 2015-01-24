class Restaurant < ActiveRecord::Base
	has_one :user,dependent: :destroy
	accepts_nested_attributes_for :user
	
	validates :name,:country,:address,:phone,:url,:email, presence: true
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates_length_of :name, within: 6..20, too_short: 'pick a longer name'
  validates_numericality_of :phone
  validates_length_of :phone, minimum: 5, too_short: 'The phone number is not valid. Enter 10 or more digits.'
end	
