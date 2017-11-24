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
    has_many :contacts, through: :contact_links, source: :from
    # belongs_to :contact_link, class_name: "Account"

    #scopes
    scope :for_email, ->(email) { where(email: email) }

    #Validations
    validates :email, presence: true, uniqueness: { case_sensitive: false}
    validates_presence_of :password, on: :create 
    validates_presence_of :password_confirmation, on: :create 
    validates_confirmation_of :password, on: :create, message: "does not match"
    validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true


    # def add_contact(new_contact)
    #     self.contacts << new_contact unless self.contacts.include?(new_contact) || new_contact == self
    # end


    def add_contact(new_contact_email)
        @username = Account.for_email(new_contact_email).first
        # if self.contact_links
        if not current_user.contacts.include?(@username) and current_user != @username
        @cont = ContactLink.new(to_id: @username.id,
                                from_id: current_user.id)
    end 

    private
    def self.authenticate(email,password)
        find_by_email(email).try(:authenticate, password)
    end

end
