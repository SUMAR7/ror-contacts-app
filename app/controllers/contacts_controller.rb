class ContactsController < ApplicationController
  # GET request to /contacts/new
  def new
    @contact = Contact.new
  end

  # GET request to /contacts/:id
  def show
    # finding a contact by id from the database
    @contact = Contact.find(params[:id])
  end

  # GET request to /contacts
  def index
    # getting all contacts from the database
    @contacts = Contact.all
  end

  # POST request to /contacts
  def create
    # Mass assignment of form fields into Contact object
    # contact_prams is a method defined below
    @contact = Contact.new(contact_params)

    # Save the Contact object to the database
    if @contact.save
      # On success: redirect to the show contact page (we will implement that shortly)
      redirect_to @contact
    else
      # On failure: render the new contact form so the user can fix the errors
      render :new, status: :unprocessable_entity
    end
  end

  # GET request to /contacts/:id/edit
  def edit
    @contact = Contact.find(params[:id])
  end


  # PATCH/PUT request to /contacts/:id
  def update
    @contact = Contact.find(params[:id])

    # Mass assignment of form fields into Contact object
    # contact_prams is a method defined below
    if @contact.update(contact_params)
      redirect_to @contact
    else
      render :edit
    end
  end

  # DELETE request to /contacts/:id
  def destroy
    contact = Contact.find(params[:id])
    # Destroying the contact from the database
    contact.destroy

    redirect_to contacts_path
  end


  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone)
  end
end
