class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	belongs_to :restaurant

  belongs_to :parent, :class_name => 'User', :foreign_key => :parent_id
  has_many :children, :class_name => 'User', :foreign_key => :parent_id
end
