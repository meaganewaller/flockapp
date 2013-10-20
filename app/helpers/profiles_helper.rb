module ProfilesHelper
  def gravatar_for_profile(user)
    gravatar_image_tag(user.email.downcase, :alt => user.name, :class => "gravatar-profile", :gravatar => {:size => 300 })
  end
end

