class Video
  attr_reader
  def initialize(data)
    @title = data[:items][0][:snippet][:title]
    @video_id = data[:items][0][:id][:videoId]
  end
end