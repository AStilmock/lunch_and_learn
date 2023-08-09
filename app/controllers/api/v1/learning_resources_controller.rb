class Api::V1::LearningResourcesController < ApplicationController
  def index
    image_data = ImageService.new.get_images(params[:country])[:results]
    images = image_data.map do |i|
      Image.new(i)
    end
    if VideoService.new.get_videos[:items] == nil
      video = {}
    else
      video_info = VideoService.new.get_videos[:items].first
      video = Video.new(video_info)
    end
    new_resource = LearningResource.new(video, images, params[:country])
    render json: LearningResourcesSerializer.new(new_resource)
  end
end