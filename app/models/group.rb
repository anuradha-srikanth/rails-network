class Group < ApplicationRecord

    belongs_to :account
    has_many :profiles

    validates :profile_id, presence: true
    validates :account_id, presence: true
    validates :name, presence: true

    


end
