class ContactLink < ApplicationRecord
    # belongs_to :account
    # # This adds account_id as one foreign key
    # belongs_to :contact, :class_name => "Account"
    # This adds contact_id as the other foreign key
    #https://ashish173.github.io/blog/2014/11/04/self-referential-associations-in-rails/

    belongs_to :to, class_name: "Account"
    belongs_to :from, class_name: "Account"

    #Validations
    validates :to_id, presence: true
    validates :from_id, presence: true

end
