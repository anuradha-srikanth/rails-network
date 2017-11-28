class Project < ApplicationRecord

    # Relationships
    belongs_to :profile

    #Validations
    validates :profile_id, presence: true

    # Scopes
    scope :alphabetical, -> { order(:name) }
    # scope :orderProficiency(level)
    # scope :orderByProficiency




end
