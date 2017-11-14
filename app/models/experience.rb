class Experience < ApplicationRecord

    # Relationships
    belongs_to :profile

    scope :chronological,        -> { order(date: :desc ) }
    # scope :orderByDuration,      -> { order(duration: :desc ) }
    scope :for_company,          -> (company){ where(company: company)}
end
