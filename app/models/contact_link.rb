class ContactLink < ApplicationRecord
    belongs_to :account
    # This adds account_id as one foreign key
    belongs_to :contact, :class_name => "Account"
    # This adds contact_id as the other foreign key


    
end
