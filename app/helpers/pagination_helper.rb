module PaginationHelper

  def paginate(pages, current_page)
    if pages > 1
      page = current_page.try(:to_i)
      page = 1 if !page or page <= 0

      prev_link = if page == 1 
                    content_tag(:span, "« Previous", :class => "prev_page disabled")
                  else
                    link_to "« Previous", "?page=#{page - 1}", :rel => "prev"
                  end

      next_link = if page == pages
                    content_tag(:span, "Next »", :class => "next_page disabled")
                  else
                    link_to "Next »", "?page=#{page + 1}", :rel => "next"
                  end
      content_tag(:div, :class => "pagination") do
        prev_link +
          next_link
      end
    end
  end

end
