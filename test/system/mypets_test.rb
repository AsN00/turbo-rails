require "application_system_test_case"

class MypetsTest < ApplicationSystemTestCase
  setup do
    @mypet = mypets(:one)
  end

  test "visiting the index" do
    visit mypets_url
    assert_selector "h1", text: "Mypets"
  end

  test "should create mypet" do
    visit mypets_url
    click_on "New mypet"

    fill_in "Age", with: @mypet.age
    fill_in "Animal type", with: @mypet.animal_type
    fill_in "Name", with: @mypet.name
    click_on "Create Mypet"

    assert_text "Mypet was successfully created"
    click_on "Back"
  end

  test "should update Mypet" do
    visit mypet_url(@mypet)
    click_on "Edit this mypet", match: :first

    fill_in "Age", with: @mypet.age
    fill_in "Animal type", with: @mypet.animal_type
    fill_in "Name", with: @mypet.name
    click_on "Update Mypet"

    assert_text "Mypet was successfully updated"
    click_on "Back"
  end

  test "should destroy Mypet" do
    visit mypet_url(@mypet)
    click_on "Destroy this mypet", match: :first

    assert_text "Mypet was successfully destroyed"
  end
end
