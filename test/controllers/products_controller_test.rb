# require incluye en este archivo el codigo que haya en test_helper
# esteincluye elementos de configuraciones para todos nuestros test.
require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  test 'render a list of products' do
    #accedemos a products para que nos devulva la url de products
    get products_path

    #Esperamos que la respuesta sea satisfactoria
    assert_response :success
    #Vamos a testear dos productos de fixtures
    assert_select '.product', 2
  end

  test 'render a detailed product page' do
    get product_path(products(:ps4))

    #Esperamos que la respuesta sea satisfactoria
    assert_response :success
    assert_select '.title', 'PS4 Fat'
    assert_select '.description', 'PS4 en buen estado'
    assert_select '.price', '150$'
  end

  test 'render a new product form' do
        get new_product_path

        #Esperamos que la respuesta sea satisfactoria
        assert_response :success
        assert_select 'form'
  end
end
