module ConferencesHelper
  def by_month(conferences)
    conferences.group_by { |conference| conference.start_date ? conference.start_date.strftime("%B %Y") : "" }
  end

  def start_day_of_conference(conference)
    conference.start_date ? conference.start_date.day : ""
  end

  def safety_policy_link(conference)
    conference.safety_policy.present? ? link_to(@conference.safety_policy, @conference.safety_policy) : "None"
  end
end
