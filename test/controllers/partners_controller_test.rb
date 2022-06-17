require "test_helper"

class PartnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @partner = partners(:one)
  end

  test "should get index" do
    get partners_url, as: :json
    assert_response :success
  end

  test "should create partner" do
    assert_difference("Partner.count") do
      post partners_url, params: { partner: { addresses: @partner.addresses, coverage_area,: @partner.coverage_area,, owner_name,: @partner.owner_name,, trading_name,: @partner.trading_name, } }, as: :json
    end

    assert_response :created
  end

  test "should show partner" do
    get partner_url(@partner), as: :json
    assert_response :success
  end

  test "should update partner" do
    patch partner_url(@partner), params: { partner: { addresses: @partner.addresses, coverage_area,: @partner.coverage_area,, owner_name,: @partner.owner_name,, trading_name,: @partner.trading_name, } }, as: :json
    assert_response :success
  end

  test "should destroy partner" do
    assert_difference("Partner.count", -1) do
      delete partner_url(@partner), as: :json
    end

    assert_response :no_content
  end
end
