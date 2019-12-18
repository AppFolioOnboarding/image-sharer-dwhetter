module ImagesHelper
  def image_tags(image)
    return if image.tags.none?

    content_tag(:label, 'Image Tags:&nbsp;'.html_safe, style: 'vertical-align: bottom') +
      image.tags.map { |tag| link_to(tag.name, root_path(tag_list: tag.name)) }.join(', ').html_safe
  end
end
