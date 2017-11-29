class Account < ApplicationRecord

    # use has_secure_password
    has_secure_password

    # has_many :contacts,
    #         class_name: "Account",
    #         foreign_key: "contact_link_id"
    has_many :contact_links, 
            class_name:  "ContactLink",
            foreign_key: "from_id",
            dependent:   :destroy
    has_many :contacts, through: :contact_links, source: :to
    has_one :qr_code
    # has_many :contacts, through: :contact_links, source: :from
    # belongs_to :contact_link, class_name: "Account"

    #scopes
    scope :for_email, ->(email) { where(email: email) }

    #Validations
    validates :email, presence: true, uniqueness: { case_sensitive: false}
    validates_presence_of :password, on: :create 
    validates_presence_of :password_confirmation, on: :create 
    validates_confirmation_of :password, on: :create, message: "does not match"
    validates_length_of :password, minimum: 4, message: "must be at least 4 characters long"


    # def add_contact(new_contact)
    #     self.contacts << new_contact unless self.contacts.include?(new_contact) || new_contact == self
    # end

    def is_contact?(contact_from, contact_to)
        return contact_from.contacts.include?(contact_to)
    end

    def add_contact(new_contact_email)
        @contact = Account.for_email(new_contact_email).first
        # if self.contact_links
        if not is_contact(current_user, @contact) and current_user != @contact
        # @cont = ContactLink.new(to_id: @contact.id, from_id: current_user.id)
            current_user.contacts << @contact
            @contact.contacts << current_user
        end
    end 

    def delete_contact(contact_email)
        @contact = Account.for_email(contact_email).first
        current_user.contacts.delete(@contact)
        @contact.contacts.delete(current_user)
    end

    private
    def self.authenticate(email,password)
        find_by_email(email).try(:authenticate, password)
    end

end
