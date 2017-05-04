module ApplicationHelper
  def display_name (candidate)
    "#{candidate.name}(#{candidate.party})"
  end
end
