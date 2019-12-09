require "application_system_test_case"

class ImagesTest < ApplicationSystemTestCase
  setup do
    @image = images(:one)
  end

  test "storing an Image URL" do
    visit new_image_path
    @image.url = "https://test"

    fill_in "image[url]", with: @image.url
    click_on "Store URL"
    assert_selector "p", text: "Image was successfully created"
  end
end
