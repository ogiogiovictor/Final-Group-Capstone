require "test_helper"

class MotorcyclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @motorcycle = motorcycles(:one)
  end

  test "should get index" do
    get motorcycles_url, as: :json
    assert_response :success
  end

  test "should create motorcycle" do
    assert_difference("Motorcycle.count") do
      post motorcycles_url, params: { motorcycle: { apr-percent: @motorcycle.apr-percent, deposit-fee: @motorcycle.deposit-fee, description: @motorcycle.description, duration: @motorcycle.duration, finance-fee: @motorcycle.finance-fee, model: @motorcycle.model, total-amount: @motorcycle.total-amount } }, as: :json
    end

    assert_response :created
  end

  test "should show motorcycle" do
    get motorcycle_url(@motorcycle), as: :json
    assert_response :success
  end

  test "should update motorcycle" do
    patch motorcycle_url(@motorcycle), params: { motorcycle: { apr-percent: @motorcycle.apr-percent, deposit-fee: @motorcycle.deposit-fee, description: @motorcycle.description, duration: @motorcycle.duration, finance-fee: @motorcycle.finance-fee, model: @motorcycle.model, total-amount: @motorcycle.total-amount } }, as: :json
    assert_response :success
  end

  test "should destroy motorcycle" do
    assert_difference("Motorcycle.count", -1) do
      delete motorcycle_url(@motorcycle), as: :json
    end

    assert_response :no_content
  end
end
