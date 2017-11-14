class Skill < ApplicationRecord

    # Relationships
    belongs_to :profile

    # Scopes
    scope :alphabetical,        -> { order(:name) }
    # scope :orderProficiency,    ->(level)
    # scope :orderByProficiency,  -> 

end
