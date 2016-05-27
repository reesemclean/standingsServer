require 'test_helper'

class LeaguesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @league = leagues(:one)
  end

  test "should get index" do
    get leagues_url
    assert_response :success
  end

  test "should create league" do
    assert_difference('League.count') do
      post leagues_url, params: { league: { name: @league.name, permitsTies: @league.permitsTies } }
    end

    assert_response 201
  end

  test "should show league" do
    get league_url(@league)
    assert_response :success
  end

  test "should update league" do
    patch league_url(@league), params: { league: { name: @league.name, permitsTies: @league.permitsTies } }
    assert_response 200
  end

  test "should destroy league" do
    assert_difference('League.count', -1) do
      delete league_url(@league)
    end

    assert_response 204
  end
end
