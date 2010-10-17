class EntriesFilter
  extend ActiveModel::Naming

  attr_accessor :severity, :facility

  def initialize(params = {})
    (params || {}).each do |key, value|
      send("#{key}=", value)
    end
  end

  def conditions
    result = {}
    result[:severity] = severity if severity.present?
    result[:facility] = facility if facility.present?
    result
  end

  def to_model
    self
  end

  def valid?()      true end
  def new_record?() true end
  def destroyed?()  true end

  def errors
    obj = Object.new
    def obj.[](key)         [] end
    def obj.full_messages() [] end
    obj
  end

  def to_key
    nil
  end

  def persisted?
    false
  end
end
