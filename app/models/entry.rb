class Entry
  include Mongoid::Document
  
  field :application_id, :type => Integer
  index :application_id

  field :severity
  index :severity

  field :facility
  field :payload,        :type => Hash
  
  field :timestamp,      :type => DateTime
  index :timestamp

  # Constants
  SEVERITY_TYPES = ["fatal", "error", "warn", "info", "debug", "unknown"]

  # Hooks
  before_validation :normalize_severity

  # Validations
  validates_presence_of  :severity, :facility, :payload, :timestamp
  validates_inclusion_of :severity, :in => SEVERITY_TYPES

  private

  def normalize_severity
    self.severity.downcase! if self.severity
  end
end
