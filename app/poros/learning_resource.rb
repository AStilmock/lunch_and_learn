class LearningResource
  attr_reader :id, :type, :country, :video, :images
  def initialize(video_data, image_data, country)
    @id = "null"
    @type = "learning_resource"
    @country = country
    @video = video_data
    @images = image_data
  end
end