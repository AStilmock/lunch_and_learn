class VideoSearch
  def service
    VideoService.new
  end

  def videos
    request = service.get_videos[:items].first
    Video.new(request)
  end
end