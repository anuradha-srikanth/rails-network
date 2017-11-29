class ContactLink < ApplicationRecord

    acts_as_taggable

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


    def add_to_group(group_name)
        @user.tag_list.add("awesome")   # add a single tag. alias for <<
    end 

    def remove_from_group(group_name)
        
    end

end
