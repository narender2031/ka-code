class Doctor
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps
  field :doctor_name, type: String
  field :phone, type: String
  field :specialisation, type: String

  has_many :appointments
  belongs_to :user
end
