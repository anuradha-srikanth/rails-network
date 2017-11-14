class Account < ApplicationRecord

    has_many :contacts, class_name: "Account", foreign_key: "contact_link_id"
    belongs_to :contact_link, class_name: "Account"

    


    def add_contact(new_contact)
        self.contacts << new_contact unless self.contacts.include?(new_contact) || new_contact == self
    end



end
