class Address < ApplicationRecord
  belongs_to :contacts, class_name: "Contact", foreign_key: "contact_id"
end