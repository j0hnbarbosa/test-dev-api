class UsersController < ApplicationController
  def create
    user_info = params['data']
    address_info = user_info['address']

    contact = Contact.new(
      first_name: user_info['first_name'],
      last_name: user_info['last_name'],
      cpf: user_info['cpf'],
      email: user_info['email'],
      birth_date: user_info['birth_date'],
    )

    address = Address.new(
      cep: address_info['cep'],
      street: address_info['street'],
      neighborhood: address_info['neighborhood'],
      city: address_info['city'],
      state: address_info['state'],
      number: address_info['number'],
      contacts: contact
    )


    address.transaction do
      
      address.save
      
      # Contact.destroy(2)
      render json: address

    end

  end
  
end
