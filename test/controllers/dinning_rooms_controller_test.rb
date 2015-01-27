require 'test_helper'

class DinningRoomsControllerTest < ActionController::TestCase
  setup do
    @dinning_room = dinning_rooms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dinning_rooms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dinning_room" do
    assert_difference('DinningRoom.count') do
      post :create, dinning_room: { name: @dinning_room.name, priority: @dinning_room.priority, widget: @dinning_room.widget }
    end

    assert_redirected_to dinning_room_path(assigns(:dinning_room))
  end

  test "should show dinning_room" do
    get :show, id: @dinning_room
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dinning_room
    assert_response :success
  end

  test "should update dinning_room" do
    patch :update, id: @dinning_room, dinning_room: { name: @dinning_room.name, priority: @dinning_room.priority, widget: @dinning_room.widget }
    assert_redirected_to dinning_room_path(assigns(:dinning_room))
  end

  test "should destroy dinning_room" do
    assert_difference('DinningRoom.count', -1) do
      delete :destroy, id: @dinning_room
    end

    assert_redirected_to dinning_rooms_path
  end
end
