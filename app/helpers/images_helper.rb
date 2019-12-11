module ImagesHelper
  def image_tags(image)
      if image.tags.any?
        content_tag(:label, 'Image Tags:&nbsp;'.html_safe, style: 'vertical-align: bottom') + image.tags.map { |tag| tag.name }.join(', ').html_safe
      end
   end
end
