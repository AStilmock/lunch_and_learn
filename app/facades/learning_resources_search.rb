class LearningResourcesSearch
  def video_service
    VideoService.new
  end

  def image_service
    ImageService.new
  end

  def learning_resources(data)
    video_info = video_service.get_videos[:items].first
    video = Video.new(video_info).as_json
    if video_info[:snippet][:title] && video_info[:id][:videoId] == nil
      video = {}
    else
      video
    end
    image_data = image_service.get_images(data)[:results]
    images = image_data.map do |i|
      Image.new(i).as_json
    end
    new_resource = LearningResource.new(video, images, data)
  end
end