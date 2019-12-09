require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  test 'Create an image' do
    url = 'https://myImageUrl.jpg'
    Image.create!(url: url)
    assert_equal Image.last.tag_list, []
    assert_equal Image.last.url, url
  end

  test 'Create an image with tag' do
    url = 'https://myImageUrlWithTag.jpg'
    tag = 'myTag'
    Image.create!(url: url, tag_list: tag)
    assert_equal Image.last.tag_list, [tag]
    assert_equal url, Image.last.url
  end

  test 'Create with invalid image url fails' do
    assert_raises ActiveRecord::RecordInvalid do
        Image.create!(url: 'myInvalidImageUrl.jpg')
    end
  end

  test 'Retrieve a image url' do
    url = 'https://myImageUrl.jpg'
    Image.create!(url: url)
    @image = Image.find_by! url: url
    assert_equal url, @image.url
  end
end
