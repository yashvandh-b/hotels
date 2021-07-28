require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

    setup do
        @branch = branches(:one)
    end

    test "should get index" do
        get hotel_branches_url(@branch)
        assert_redirected_to root_url
    end

    test "should get new" do
        get new_hotel_branch_url(@branch)
        assert_redirected_to root_url
    end

    test "should create branch" do
        assert_difference('Branch.count') do
        post hotel_branches_url(@branch.hotel_id), params: { branch: { name: @branch.name, manager_phone: @branch.manager_phone, manager_name: @branch.manager_name, hotel_id: @branch.hotel_id } }
        end
        assert_redirected_to root_url
    end

    test "should destroy branch" do
        assert_difference('Branch.count', -1) do
        delete branch_url(@branch)
        end
        assert_redirected_to hotels_url
    end

end