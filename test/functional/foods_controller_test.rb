require 'test_helper'

class FoodsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:foods)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_food
    assert_difference('Food.count') do
      post :create, :food => { }
    end

    assert_redirected_to food_path(assigns(:food))
  end

  def test_should_show_food
    get :show, :id => foods(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => foods(:one).id
    assert_response :success
  end

  def test_should_update_food
    put :update, :id => foods(:one).id, :food => { }
    assert_redirected_to food_path(assigns(:food))
  end

  def test_should_destroy_food
    assert_difference('Food.count', -1) do
      delete :destroy, :id => foods(:one).id
    end

    assert_redirected_to foods_path
  end
end
