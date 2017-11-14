class Account < ApplicationRecord

    has_many :contacts, class_name: "Account", foreign_key: "contact_link_id"
    belongs_to :contact_link, class_name: "Account"

end
