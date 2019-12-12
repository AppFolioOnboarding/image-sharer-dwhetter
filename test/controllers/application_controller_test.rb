require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'test application controller' do
    get '/'
    assert_response 200
    assert_select 'h1', 'Image List'
  end

  test 'test image count' do
    get '/'
    assert_select 'img', count: 2
  end

  test 'test image with no valid tag' do
    get '/?tag_list=no_tag'
    assert_select 'img', count: 0
    assert_select 'h2', text: 'No images found.'
  end

  test 'test image with valid tag' do
    Image.create!(url: 'https://my_image_url1', tag_list: 'test')
    Image.create!(url: 'https://my_image_url2', tag_list: 'test')
    Image.create!(url: 'https://my_image_url3', tag_list: 'test')
    get '/?tag_list=test'
    assert_select 'img', count: 3
  end
end
