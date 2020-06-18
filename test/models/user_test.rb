require 'test_helper'

class UserTest < ActiveSupport::TestCase

	def setup
		@user = User.new(name: "Example User", email: "user@example.com", 
			password: "foobar", password_confirmation: "foobar")
	end

    test "should be valid" do
    	assert @user.valid?
    end

    test "name should be present" do
    	assert @user.name = ""
    	assert_not @user.valid?
    end

    test "email should be present" do
    	assert @user.email = ""
    	assert_not @user.valid?
    end

    test "email addresses should be unique" do
    	duplicate_user = @user.dup
    	duplicate_user.email =@user.email.upcase
    	@user.save
    	assert_not duplicate_user.valid?
    end

    test "email addresses should be saved as lowercase" do
    	mixed_case_email = "Foo@Example.Com"
    	@user.email = mixed_case_email
    	@user.save
    	assert_equal mixed_case_email.downcase, @user.reload.email
    end

end
