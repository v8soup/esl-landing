require "application_system_test_case"

class CoursesTest < ApplicationSystemTestCase
  setup do
    @course = courses(:one)
  end

  test "visiting the index" do
    visit courses_url
    assert_selector "h1", text: "Courses"
  end

  test "should create course" do
    visit courses_url
    click_on "New course"

    fill_in "Active", with: @course.active
    fill_in "Apr", with: @course.apr
    fill_in "Aug", with: @course.aug
    fill_in "Dec", with: @course.dec
    fill_in "Feb", with: @course.feb
    fill_in "Jan", with: @course.jan
    fill_in "Jul", with: @course.jul
    fill_in "Jun", with: @course.jun
    fill_in "Mar", with: @course.mar
    fill_in "May", with: @course.may
    fill_in "Nov", with: @course.nov
    fill_in "Oct", with: @course.oct
    fill_in "Price", with: @course.price
    fill_in "Sep", with: @course.sep
    fill_in "Title", with: @course.title
    fill_in "When", with: @course.when
    fill_in "Year", with: @course.year
    click_on "Create Course"

    assert_text "Course was successfully created"
    click_on "Back"
  end

  test "should update Course" do
    visit course_url(@course)
    click_on "Edit this course", match: :first

    fill_in "Active", with: @course.active
    fill_in "Apr", with: @course.apr
    fill_in "Aug", with: @course.aug
    fill_in "Dec", with: @course.dec
    fill_in "Feb", with: @course.feb
    fill_in "Jan", with: @course.jan
    fill_in "Jul", with: @course.jul
    fill_in "Jun", with: @course.jun
    fill_in "Mar", with: @course.mar
    fill_in "May", with: @course.may
    fill_in "Nov", with: @course.nov
    fill_in "Oct", with: @course.oct
    fill_in "Price", with: @course.price
    fill_in "Sep", with: @course.sep
    fill_in "Title", with: @course.title
    fill_in "When", with: @course.when
    fill_in "Year", with: @course.year
    click_on "Update Course"

    assert_text "Course was successfully updated"
    click_on "Back"
  end

  test "should destroy Course" do
    visit course_url(@course)
    click_on "Destroy this course", match: :first

    assert_text "Course was successfully destroyed"
  end
end
