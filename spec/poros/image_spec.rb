require 'rails_helper'

RSpec.describe "Image PORO" do
  describe 'Image' do
    it 'exists and has attributes' do
      data = {
        :alt_description => "MacBook Pro on top of brown table",
        :urls => {
          :raw => "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixid=M3w0ODU5ODR8MHwxfHNlYXJjaHwxfHxjb21wdXRlcnxlbnwwfHx8fDE2OTE0NDk3MjN8MA&ixlib=rb-4.0.3"
        }
      }
      image = Image.new(data)
      expect(image).to be_a Image
      expect(image.alt_tag).to eq(data[:alt_description])
      expect(image.alt_tag).to eq "MacBook Pro on top of brown table"
      expect(image.url).to eq(data[:urls][:raw])
      expect(image.url).to eq "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixid=M3w0ODU5ODR8MHwxfHNlYXJjaHwxfHxjb21wdXRlcnxlbnwwfHx8fDE2OTE0NDk3MjN8MA&ixlib=rb-4.0.3"
    end
  end
end