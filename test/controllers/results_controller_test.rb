require 'test_helper'

class ResultsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @result = results(:one)
  end

  test "should get index" do
    get results_url
    assert_response :success
  end

  test "should create result" do
    assert_difference('Result.count') do
      post results_url, params: { result: { date: @result.date, league_id: @result.league_id, losing_teams_id: @result.losing_teams_id, tied_teams_id: @result.tied_teams_id, winning_teams_id: @result.winning_teams_id } }
    end

    assert_response 201
  end

  test "should show result" do
    get result_url(@result)
    assert_response :success
  end

  test "should update result" do
    patch result_url(@result), params: { result: { date: @result.date, league_id: @result.league_id, losing_teams_id: @result.losing_teams_id, tied_teams_id: @result.tied_teams_id, winning_teams_id: @result.winning_teams_id } }
    assert_response 200
  end

  test "should destroy result" do
    assert_difference('Result.count', -1) do
      delete result_url(@result)
    end

    assert_response 204
  end
end
