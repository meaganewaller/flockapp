module SpeakersHelper
  def gravatar_for_speaker(speaker)
    gravatar_image_tag(speaker.user.email.downcase, :alt => speaker.user.name, :class => "gravatar-speaker", :gravatar => {:size => 50 })
  end
end
