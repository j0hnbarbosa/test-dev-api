class Contact < ApplicationRecord
  has_many :addresses, dependent: :destroy
  
  accepts_nested_attributes_for :addresses
  validates :email, uniqueness: true
  validates :cpf, uniqueness: true
  
  before_save :downcase_fields

  def downcase_fields
     self.email.strip.downcase
  end

end