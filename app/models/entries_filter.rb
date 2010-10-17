class EntriesFilter
  extend ActiveModel::Naming

  attr_accessor :severity, :facility,
    :time_frame, :time_from, :time_to,
    :payload

  def initialize(params = {})
    (params || {}).each do |key, value|
      send("#{key}=", value)
    end
  end

  def conditions
    result = {}
    result[:severity] = severity if severity.present?
    result[:facility] = %r{#{facility}} if facility.present?
    handle_time_frame(result)
    handle_payload(result)
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

  private

    def handle_time_frame(result)
      case time_frame
        when 'Today'
          result[:timestamp] = { "$gte" => Time.zone.now.beginning_of_day }
        when 'Yesterday'
          result[:timestamp] = {
            "$gte" => 1.day.ago.utc.beginning_of_day,
            "$lt" => Time.zone.now.beginning_of_day 
          }
        when 'Custom'
          result[:timestamp] = {}
          result[:timestamp]['$gte'] = Time.zone.parse(time_from) if time_from.present?
          result[:timestamp]['$lte'] = Time.zone.parse(time_to) if time_to.present?
      end
    end

    def handle_payload(result)
      if payload.present?
        payload.values.each do |filter|
          if filter['key'].present? && filter['value'].present?
            result["payload.#{filter['key']}"] = %r{#{filter['value']}}
          end
        end
      end
    end
end
