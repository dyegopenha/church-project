require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
  end

  test "visiting the index" do
    visit users_url
    assert_selector "h1", text: "Users"
  end

  test "should create user" do
    visit users_url
    click_on "New user"

    fill_in "About", with: @user.about
    fill_in "Address", with: @user.address
    fill_in "Address number", with: @user.address_number
    fill_in "Address opt", with: @user.address_opt
    fill_in "Birthday", with: @user.birthday
    fill_in "Cpf", with: @user.cpf
    fill_in "Department", with: @user.department_id
    fill_in "Email", with: @user.email
    check "Member" if @user.member
    fill_in "Member at", with: @user.member_at
    fill_in "Name", with: @user.name
    fill_in "Office", with: @user.office
    fill_in "Phone", with: @user.phone
    fill_in "Zipcode", with: @user.zipcode
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit user_url(@user)
    click_on "Edit this user", match: :first

    fill_in "About", with: @user.about
    fill_in "Address", with: @user.address
    fill_in "Address number", with: @user.address_number
    fill_in "Address opt", with: @user.address_opt
    fill_in "Birthday", with: @user.birthday
    fill_in "Cpf", with: @user.cpf
    fill_in "Department", with: @user.department_id
    fill_in "Email", with: @user.email
    check "Member" if @user.member
    fill_in "Member at", with: @user.member_at
    fill_in "Name", with: @user.name
    fill_in "Office", with: @user.office
    fill_in "Phone", with: @user.phone
    fill_in "Zipcode", with: @user.zipcode
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit user_url(@user)
    click_on "Destroy this user", match: :first

    assert_text "User was successfully destroyed"
  end
end
