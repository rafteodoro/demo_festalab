
class User < ApplicationRecord
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  CPF_REGEX = /\A(\d{3}\.){2}\d{3}-\d{2}\z/i
  PHONE_REGEX = /\A(\(\d{2}\)|\d{2})(\s)*\d{4,5}-?\d{4}\z/i

  # Validates the presence of the name attribute
  validates :name, presence: true
  # Validates the presence of the phone attribute
  validates :phone, presence: true
  # Validates the format of the phone attribute using the PHONE_REGEX constant
  validates_format_of :phone, with: PHONE_REGEX, message: 'should follow the format (xx) xxxx-xxxx or (xx) xxxxx-xxxx'
  # Validates the presence of the cpf attribute and its uniqueness
  validates :cpf, presence: true, uniqueness: true
  # Validates the format of the cpf attribute using the CPF_REGEX constant
  validates_format_of :cpf, with: CPF_REGEX, message: 'should follow the format xxx.xxx.xxx-xx'
  # Validates the presence of the email attribute and its uniqueness
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  # Validates the format of the email attribute using the EMAIL_REGEX constant
  validates_format_of :email, with: EMAIL_REGEX, message: '%{value} is not a valid email address'

  # Defines the search method to be able to search by any attribute
  def self.search_by_any_attribute(attributes, keyword)
    # Builds the query with the attributes and the keyword to search in the database
    query = attributes.map { |attribute| "#{attribute} LIKE :search_values" }.join(' OR ')
    User.where(query, search_values: "%#{keyword}%")
  end
end
