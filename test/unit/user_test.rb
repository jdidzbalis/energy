require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a name" do
  	user = User.new
  	assert !user.save
  	assert !user.errors[:first_name].empty?
	assert !user.errors[:last_name].empty?
  	assert !user.errors[:profile_name].empty?
  end

  test "a user should have profile name formatted" do
  	user = User.new
  	user.profile_name = "My profile with spaces"
  	assert !user.save
  	assert !user.errors[:profile_name].empty?

end

end
