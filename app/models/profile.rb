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

    #Validations
    validates :username, presence: true, uniqueness: { case_sensitive: false}
    validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format" }
    validates :phone, format: { with: /\A\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", allow_blank: true }

    private
    def reformat_phone
        phone = self.phone.to_s  # change to string in case input as all numbers 
        phone.gsub!(/[^0-9]/,"") # strip all non-digits
        self.phone = phone       # reset self.phone to new string
    end

    def self.authenticate(email,password)
        find_by_email(email).try(:authenticate, password)
    end
    


end
