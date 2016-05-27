require 'test_helper'

class ResultParticipantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @result_participant = result_participants(:one)
  end

  test "should get index" do
    get result_participants_url
    assert_response :success
  end

  test "should create result_participant" do
    assert_difference('ResultParticipant.count') do
      post result_participants_url, params: { result_participant: {  } }
    end

    assert_response 201
  end

  test "should show result_participant" do
    get result_participant_url(@result_participant)
    assert_response :success
  end

  test "should update result_participant" do
    patch result_participant_url(@result_participant), params: { result_participant: {  } }
    assert_response 200
  end

  test "should destroy result_participant" do
    assert_difference('ResultParticipant.count', -1) do
      delete result_participant_url(@result_participant)
    end

    assert_response 204
  end
end
