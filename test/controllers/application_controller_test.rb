require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'test application controller' do
    get '/'
    assert_response 302
    assert_select 'body', 'You are being redirected.'
  end
end
