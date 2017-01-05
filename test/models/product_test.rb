require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:name].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:status].any?
  end
  test "price must be positive" do
    product = Product.new(name:       "iphone",
                          description: "Apple iphone 64gb",
                          status:   0)
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
                 product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"],
                 product.errors[:price]

    product.price = 1
    assert product.valid?
  end


  test "name must be unique for a product" do
    product = Product.new(name: products(:india).name,description: "yyy", price: 1, status: 0)
    assert product.invalid?
    assert_equal ["has already been taken"], product.errors[:name]
  end

  test "product is not valid without a unique name" do
    product = Product.new(name: products(:india).name, description: "yyy", price: 1, status: 0)
  assert product.invalid?
  assert_equal [I18n.translate('errors.messages.taken')], product.errors[:name]
    end
end
