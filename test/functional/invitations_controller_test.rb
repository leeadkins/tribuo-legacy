require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:invitations)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_invitation
    assert_difference('Invitation.count') do
      post :create, :invitation => { }
    end

    assert_redirected_to invitation_path(assigns(:invitation))
  end

  def test_should_show_invitation
    get :show, :id => invitations(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => invitations(:one).id
    assert_response :success
  end

  def test_should_update_invitation
    put :update, :id => invitations(:one).id, :invitation => { }
    assert_redirected_to invitation_path(assigns(:invitation))
  end

  def test_should_destroy_invitation
    assert_difference('Invitation.count', -1) do
      delete :destroy, :id => invitations(:one).id
    end

    assert_redirected_to invitations_path
  end
end
