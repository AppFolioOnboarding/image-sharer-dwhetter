require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'test application controller' do
    get '/'
    assert_response 200
    assert_select 'h1', 'Image List'
  end

  test 'test image count' do
    get '/'
    assert_select 'img' do |image|
      assert_select image, 'img', 2
    end
  end
end
