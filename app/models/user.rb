class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :business_cards, dependent: :destroy
  has_many :active_relationships, class_name: "Relationship", foreign_key: :potential_contacts_id, dependent: :destroy
  has_many :passive_relationshsips, class_name: "Relationship", foreign_key: :contacts_id, dependent: :destroy
  has_many :contacts, through: :active_relationships, source: :contacts
  has_many :potential_contacts, through: :passive_relationshsips, source: :potential_contacts        
end
