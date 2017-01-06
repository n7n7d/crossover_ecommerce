require 'test_helper'

class CatalogControllerTest < ActionDispatch::IntegrationTest
  base_title = 'Crossover Ecommerce'

  test "should get index" do
    get catalog_index_url
    assert_response :success
    assert_select "title", "Welcome|#{base_title}"

  end

end
