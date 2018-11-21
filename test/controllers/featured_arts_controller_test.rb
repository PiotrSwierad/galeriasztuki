require 'test_helper'

class FeaturedArtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @featured_art = featured_arts(:one)
  end

  test "should get index" do
    get featured_arts_url
    assert_response :success
  end

  test "should get new" do
    get new_featured_art_url
    assert_response :success
  end

  test "should create featured_art" do
    assert_difference('FeaturedArt.count') do
      post featured_arts_url, params: { featured_art: {  } }
    end

    assert_redirected_to featured_art_url(FeaturedArt.last)
  end

  test "should show featured_art" do
    get featured_art_url(@featured_art)
    assert_response :success
  end

  test "should get edit" do
    get edit_featured_art_url(@featured_art)
    assert_response :success
  end

  test "should update featured_art" do
    patch featured_art_url(@featured_art), params: { featured_art: {  } }
    assert_redirected_to featured_art_url(@featured_art)
  end

  test "should destroy featured_art" do
    assert_difference('FeaturedArt.count', -1) do
      delete featured_art_url(@featured_art)
    end

    assert_redirected_to featured_arts_url
  end
end
