module ApplicationHelper
  def display_image(entity, image_type)
    image = entity.send(image_type) if entity.respond_to?(image_type)

    if image&.attached?
      image_tag(image, alt: "#{image_type.capitalize} Image")
    else
      image_tag(default_image_path, alt: "Default Image")
    end
  end

  def get_image_url(entity, image_type)
    image = entity.send(image_type)

    if image.attached?
      Rails.application.routes.url_helpers.rails_blob_url(image)
    else
      default_image_path
    end
  end

  def default_image_path
    image_path('Images/bat.jpg')
  end

  def linked_items_list(items, link_path)
    items.map.with_index do |item, index|
      link = link_to(item.name, link_path.call(item.name), title: "#{item.name} Movies, TV-Shows")
      link += ',' unless index == items.size - 1
      link
    end.join(' ').html_safe
  end
end
