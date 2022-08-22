class ContactsController < ApplicationController
  before_action :authorize_request

  def create
    result = ContactsService.new({
      user_info: params['data']
    }).call

    render json: result
  end

  # /contacts?offset&limit&search
  def get
    params
    .with_defaults(offset: 0, limit: 100)

    render json: {
                  contacts: Contact
                                  .joins(:addresses)
                                  .where("contacts.first_name || ' ' || contacts.last_name Ilike ?","%#{params['search']}%")
                                  .offset(params['offset'])
                                  .limit(params['limit'])
                                  .order('contacts.first_name')
                                  .select('addresses.*, contacts.*'),
                  count: Contact.count     
                }
  end

end
