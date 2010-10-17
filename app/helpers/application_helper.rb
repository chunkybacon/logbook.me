module ApplicationHelper
  def simple_human_friendly_payload(hash)
    hash.map { |el| "#{el.first}: #{el.last}" }.join(', ')
  end

  def human_friendly_payload(hash)
    hash.map { |el| "<span class='key'>#{el.first}</span>: <span class='value'>#{el.last}</span>" }.
      join(',<br />')
  end
end
