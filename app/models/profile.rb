class Profile < ApplicationRecord

    # Relationships
    belongs_to :account
    has_many :skills
    has_many :projects
    has_many :experiences

    # validates :profile_id, presence: true

    # Scopes
    scope :alphabetical,    -> { order(:name) }
    scope :ofDesignation,   ->(des) { where(designation: des) }
    scope :for_skill,       ->(skill) { where("skill like ?", "%#{skill.downcase}%")}
    scope :for_experience,  ->(exp) { where("exp like ?", "%#{exp.downcase}%")}
    # scope :for_school       ->(school)

    #Validations
    # validates :username, presence: true, uniqueness: { case_sensitive: false}
    validates :account_id, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format" }
    validates :phone_no, format: { with: /\A\(?\d{3}\)?[-. ]?\d{3}[-.]?\d{4}\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", allow_blank: true }

    # Other methods
    def name
        "#{last_name}, #{first_name}"
    end

    def proper_name
        "#{first_name} #{last_name}"
    end

    # Callbacks
    before_save :reformat_phone

    private
    def reformat_phone
        phone_no = self.phone_no.to_s  # change to string in case input as all numbers 
        phone_no.gsub!(/[^0-9]/,"") # strip all non-digits
        self.phone_no = phone_no       # reset self.phone to new string
    end

    
end
