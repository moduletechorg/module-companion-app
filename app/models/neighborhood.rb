class Neighborhood < ApplicationRecord
  validates :name, :city, :state, presence: true
  validates :state, length: { is: 2 }

  has_many_attached :images
  after_update :resize_images

  def city_state_name
    self[:city] + ', ' + self[:state]
  end

  private

    def resize_images
      if self.images.attached?
        images = self.images
        images.each do |i|
          image_path = ActiveStorage::Blob.service.send(:path_for, i.blob.key)
          image = MiniMagick::Image.new(image_path)
          if image.dimensions != [400, 400]
           image.resize "400x400"
          end
        end
      end
    end

end
