require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'test application controller' do
    get '/'
    assert_response :ok
    assert_select 'body', 'Hello World'
  end
end
