module ApplicationHelper
  def display_image(entity, image_type)
    image = entity.send(image_type) if entity.respond_to?(image_type)

    if image&.attached?
      image_tag(image, alt: "#{image_type.capitalize} Image")
    else
      image_tag(default_image_path, alt: "Default Image")
    end
  end

  def default_image_path
    image_path('Images/bat.jpg')
  end
end
