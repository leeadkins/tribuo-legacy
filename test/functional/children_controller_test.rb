require 'test_helper'

class ChildrenControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:children)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_child
    assert_difference('Child.count') do
      post :create, :child => { }
    end

    assert_redirected_to child_path(assigns(:child))
  end

  def test_should_show_child
    get :show, :id => children(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => children(:one).id
    assert_response :success
  end

  def test_should_update_child
    put :update, :id => children(:one).id, :child => { }
    assert_redirected_to child_path(assigns(:child))
  end

  def test_should_destroy_child
    assert_difference('Child.count', -1) do
      delete :destroy, :id => children(:one).id
    end

    assert_redirected_to children_path
  end
end
