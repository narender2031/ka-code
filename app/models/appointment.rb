class Appointment
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  include Mongoid::Timestamps

  field :disease, type: String

  belongs_to :doctor, class_name: "Doctor"
  belongs_to :patient, class_name: "Patient"
  belongs_to :user
end
