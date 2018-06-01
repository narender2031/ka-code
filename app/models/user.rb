class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :email, type: String
  field :google_token, type: String
  field :facebook_token, type: String
  has_many :patients
  has_many :doctors
  has_many :appointments
end
