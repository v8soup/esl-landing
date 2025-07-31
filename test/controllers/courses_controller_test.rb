require "test_helper"

class CoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should get new" do
    get new_course_url
    assert_response :success
  end

  test "should create course" do
    assert_difference("Course.count") do
      post courses_url, params: { course: { active: @course.active, apr: @course.apr, aug: @course.aug, dec: @course.dec, feb: @course.feb, jan: @course.jan, jul: @course.jul, jun: @course.jun, mar: @course.mar, may: @course.may, nov: @course.nov, oct: @course.oct, price: @course.price, sep: @course.sep, title: @course.title, when: @course.when, year: @course.year } }
    end

    assert_redirected_to course_url(Course.last)
  end

  test "should show course" do
    get course_url(@course)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_url(@course)
    assert_response :success
  end

  test "should update course" do
    patch course_url(@course), params: { course: { active: @course.active, apr: @course.apr, aug: @course.aug, dec: @course.dec, feb: @course.feb, jan: @course.jan, jul: @course.jul, jun: @course.jun, mar: @course.mar, may: @course.may, nov: @course.nov, oct: @course.oct, price: @course.price, sep: @course.sep, title: @course.title, when: @course.when, year: @course.year } }
    assert_redirected_to course_url(@course)
  end

  test "should destroy course" do
    assert_difference("Course.count", -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end
