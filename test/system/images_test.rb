require 'application_system_test_case'

class ImagesTest < ApplicationSystemTestCase
  setup do
    @image = images(:one)
  end

  test 'storing an Image URL' do
    visit new_image_path
    @image.url = 'https://test'

    fill_in 'image[url]', with: @image.url
    click_on 'Store URL'
    assert_selector 'p', text: 'Image was successfully created'
  end

  test 'storing an Image URL with a tag' do
    visit new_image_path
    @image.url = 'https://test'

    fill_in 'image[url]', with: @image.url
    fill_in 'image[tag_list]', with: 'imageTag'
    click_on 'Store URL'
    assert_selector 'p', text: 'Image was successfully created'
    assert_selector 'body', text: 'imageTag'
  end

  test 'storing an invalid Image URL' do
    visit new_image_path
    @image.url = 'http//test'

    fill_in 'image[url]', with: @image.url
    click_on 'Store URL'
    assert_selector 'h2', text: '1 error prohibited this image from being saved:'
    assert_selector 'li', text: 'Url is invalid'
  end
end
