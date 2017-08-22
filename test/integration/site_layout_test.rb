require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
	test "hello test" do
		get root_path
		assert_select "h1", "hello"
	end
end