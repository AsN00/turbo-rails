require "test_helper"

class MypetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mypet = mypets(:one)
  end

  test "should get index" do
    get mypets_url
    assert_response :success
  end

  test "should get new" do
    get new_mypet_url
    assert_response :success
  end

  test "should create mypet" do
    assert_difference("Mypet.count") do
      post mypets_url, params: { mypet: { age: @mypet.age, animal_type: @mypet.animal_type, name: @mypet.name } }
    end

    assert_redirected_to mypet_url(Mypet.last)
  end

  test "should show mypet" do
    get mypet_url(@mypet)
    assert_response :success
  end

  test "should get edit" do
    get edit_mypet_url(@mypet)
    assert_response :success
  end

  test "should update mypet" do
    patch mypet_url(@mypet), params: { mypet: { age: @mypet.age, animal_type: @mypet.animal_type, name: @mypet.name } }
    assert_redirected_to mypet_url(@mypet)
  end

  test "should destroy mypet" do
    assert_difference("Mypet.count", -1) do
      delete mypet_url(@mypet)
    end

    assert_redirected_to mypets_url
  end
end
