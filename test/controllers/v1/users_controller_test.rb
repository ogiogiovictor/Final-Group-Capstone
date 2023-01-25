# frozen_string_literal: true

require 'test_helper'

module V1
  class UsersControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
      get v1_users_index_url
      assert_response :success
    end

    test 'should get show' do
      get v1_users_show_url
      assert_response :success
    end

    test 'should get store' do
      get v1_users_store_url
      assert_response :success
    end

    test 'should get update' do
      get v1_users_update_url
      assert_response :success
    end

    test 'should get destroy' do
      get v1_users_destroy_url
      assert_response :success
    end
  end
end
