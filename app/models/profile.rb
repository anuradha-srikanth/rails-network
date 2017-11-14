class Profile < ApplicationRecord

    # Relationships
    has_many :skills
    has_many :projects
    has_many :experience


  # Scopes
    scope :alphabetical,    -> { order(:name) }
    scope :ofDesignation,   ->(des) { where(designation: des) }
    scope :for_skill,       ->(skill) { where("skill like ?", "%#{skill.downcase}%")}
    scope :for_experience,  ->(exp) { where("exp like ?", "%#{exp.downcase}%")}
# scope :for_school       ->(school)


    


end
