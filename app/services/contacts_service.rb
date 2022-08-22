class ContactsService
    def initialize(params)
      @user_info = params[:user_info]
    end

    def call
      address_info = @user_info['address']
  
      contact = Contact.new(
        first_name: @user_info['first_name'],
        last_name: @user_info['last_name'],
        cpf: @user_info['cpf'],
        email: @user_info['email'],
        birth_date: @user_info['birth_date'],
      )

  
      contact.transaction do
        begin
          if contact.save!
            adress = contact.addresses.create(
              cep: address_info['cep'],
              street: address_info['street'],
              neighborhood: address_info['neighborhood'],
              city: address_info['city'],
              state: address_info['state'],
              number: address_info['number'],
              # contacts: contact
            )
          end
            
        rescue ActiveRecord::RecordInvalid => e
          puts e
          {error: true, message:  e }
        end

      end
    end
    
  end