class Entry
  include Mongoid::Document


  field :severity
  field :payload, :type => Hash


 # Associations
  #belongs_to :application

  #Attributes
  #attr_accessible :severity, :facility, :payload, :timestamp

  #Constants
  #SEVERITY_TYPES = ["fatal", "error", "warn", "info", "debug"]

  #Hooks
  #before_validation :normalize_severity
  #before_save :serialize_payload

  #Validations
  #validates_presence_of  :severity, :facility, :payload
  #validates_inclusion_of :severity, :in => SEVERITY_TYPES

  private

  #def serialize_payload
    #ActiveRecord::Base.include_root_in_json = false
    #self.payload = self.payload.to_json
  #end

  #def normalize_severity
    #self.severity.downcase! if self.severity
  #end
end
