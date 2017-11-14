class Project < ApplicationRecord

    # Relationships
    belongs_to :profile

    # Scopes
    scope :alphabetical, -> { order(:name) }
    

end
