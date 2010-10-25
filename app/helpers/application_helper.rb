module ApplicationHelper
  def simple_human_friendly_payload(hash)
    hash.map { |el| "#{el.first}: #{el.last}" }.join(', ')
  end

  def human_friendly_payload(hash)
    hash.map do |el|
      content_tag(:span, el.first, :class => "key"  ) + ": " +
      content_tag(:span, el.last,  :class => "value")
    end.join(',<br />')
  end
end
