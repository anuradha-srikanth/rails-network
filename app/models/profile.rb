class Profile < ApplicationRecord

    # Relationships
    has_many :skills
    has_many :projects
    has_many :experience




scope :ofDesignation,   ->(des) { where(designation: des) }
scope :for_skill,       ->(skill)
scope :for_experience,  ->(exp)
# scope :for_school       ->(school)



end
