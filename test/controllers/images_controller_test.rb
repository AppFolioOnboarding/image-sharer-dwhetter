require 'test_helper'

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @image = images(:one)
  end

  test 'should get new' do
    get new_image_url
    assert_response :success
    assert_select 'body', /Enter an image URL/
  end

  test 'should create image' do
    assert_difference('Image.count') do
      @image.url = 'https://my_image_url'
      post images_url, params: { image: { url: @image.url } }
    end

    assert_redirected_to image_url(Image.last)
  end

  test 'should not create image with invalid url' do
    assert_no_difference('Image.count') do
      @image.url = 'my_invalid_image_url'
      post images_url, params: { image: { url: @image.url } }
    end
  end

  test 'should show image' do
    get image_url(@image)
    assert_response :success
    assert_select 'body', /Back/
  end
end
