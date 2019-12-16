module ImagesHelper
  def image_tags(image)
    return if image.tags.none?

    content_tag(:label, 'Image Tags:&nbsp;'.html_safe, style: 'vertical-align: bottom') +
      image.tags.map(&:name).join(', ').html_safe
  end
end
