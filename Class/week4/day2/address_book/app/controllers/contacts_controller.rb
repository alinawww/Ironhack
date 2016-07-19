class ContactsController < ApplicationController
  def index
    @contacts = Contact.order('name ASC')
  end
  def new
    render 'new'
  end
  def create
    contact = Contact.new(
      :name => params[:contact][:name],
      :address => params[:contact][:address],
      :phone_number => params[:contact][:phone],
      :email_address => params[:contact][:email],
      :status => params[:contact][:status])
    # Now we save the contact
    contact.save
    redirect_to("/contacts")
  end
  def showDetails
    @contacts = Contact.order('name ASC')
    @contact = Contact.find_by(id: params[:id])
    render 'details'
  end
  def createFavorite
    # byebug
    @contact = Contact.find_by(id: params[:id])
    @contact.update(status: "favorite")
  end
  def showFavorites
    @favorites = Contact.where(status: "favorite")
    render 'favorites'
  end

  def showSearch
    @first = params[:search_term]
    @results = Contact.where("name like ?", "#{@first}%")
    # byebug
    render 'search_results'
  end
  def showWizard
    render 'it-s-a-wizard'
  end
end
