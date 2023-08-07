class VideoSearch
  def service
    VideoService.new
  end

  def videos
    service.get_videos.map do |video_data|
      Video.new(video_data)
    end
  end
end