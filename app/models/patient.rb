class Patient
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps
  field :patient_name, type: String
  field :phone, type: String

  has_many :appointments
  belongs_to :user
end
