module EventsHelper
  def header_background_image_url
    "https://az810058.vo.msecnd.net/site/global/Content/img/home-search-bg-0#{rand(6)}.jpg"
  end

  def is_publishable?
    !!current_user &&
        @event.user_id == current_user.id &&
        @event.published_at.nil?
  end

  def is_editable?
    !!current_user &&
        @event.user_id == current_user.id
  end
end
