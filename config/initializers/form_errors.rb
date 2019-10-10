ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  fragment = Nokogiri::HTML.fragment(html_tag)
  field = fragment.at('input,select,textarea')

  html = if field
           field['class'] = "#{['class']} invalid"
           html = <<-HTML
              #{fragment.to_s}
              <span class="helper-text" data-error="#{instance.error_message.uniq.join(', ')}"></span>
           HTML
           html
         else
           html_tag
         end

  html.html_safe
end