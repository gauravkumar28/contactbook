class ContactsController < ApplicationController
  
  def index
      @contacts = Contact.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @contact = Contact.find_by_id(params[:id])
  end

  def new
    @contact = Contact.new
    @contact.emails.build
    @contact.persons.build
    @contact.phones.build
  end

  def create
    person = Phone.where(phonenumber: params[:contact][:phone][:phonenumber]).first
    if person
      @contact = person.contact
      @contact.emails.new(params[:contact][:email])
      @contact.persons.new(params[:contact][:person])
     end
     person = Person.where(name: params[:contact][:person][:name]).first
    if person
      @contact = person.contact
      @contact.emails.new(params[:contact][:email])
      @contact.phones.new(params[:contact][:phone])
     end
     email = Email.where(email_url: params[:contact][:email][:email_url]).first 
    if email
      @contact = email.contact
      @contact.phones.new(params[:contact][:phone])
      @contact.persons.new(params[:contact][:person])
    end
    unless @contact 
      @contact = Contact.new()
      @contact.emails.new(params[:contact][:email])
      @contact.persons.new(params[:contact][:person])
      @contact.phones.new(params[:contact][:phone])  
    end

    if @contact.save!
      redirect_to contact_path(@contact)
    else
      render 'new'
    end
  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def feature_params
    params.require(:contact).permit(:id, :name, :phone, emails_attributes: [:id, :email_url, :_destroy])
  end
end