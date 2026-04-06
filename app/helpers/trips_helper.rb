module TripsHelper
  def render_places_list(places)
    if places.any?
      content_tag(:ul, class: "mb-0 ps-3") do
        places.map { |place| content_tag(:li, place.name) }.join.html_safe
      end
    else
      content_tag(:span, "Aucune activité sélectionnée", class: "text-muted")
    end
  end
end
