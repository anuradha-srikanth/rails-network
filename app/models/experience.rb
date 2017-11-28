class Experience < ApplicationRecord

    # Relationships
    belongs_to :profile

    #Validations
    validates :profile_id, presence: true


    scope :chronological,        -> { order(date: :desc ) }
    # scope :orderByDuration,      -> { order(duration: :desc ) }
    scope :for_company,          -> (company){ where(company: company)}
end
