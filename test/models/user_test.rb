require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(lname: "Wilson", fname: "James", email: "wl@aol.com", thumbnail: "wl.png")
  end


  test "User must be valid" do
    assert @user.valid?
  end

  test "last name must be present" do
    @user.lname = ""
    assert_not @user.valid?
  end

  test "First name must be present" do
    @user.fname = ""
    assert_not @user.valid?
  end

  test "Email must be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "Email format must be valid" do
    invalid_email_formats = ["vm.sdsd", "asasa", "gmail.com", "10"]
    invalid_email_formats.each do |ief|
      begin
        @user.email = ief
        assert false, "#{ief} email format invalid"
      rescue
        assert true
      end
    end
  end

  test "Thmbnail must be in  .png, .jpg, or .gif. exntensions" do
    invalid_thumbnail_extensions = ["abc.gif", "asasa", "xyz", "123"]
    invalid_thumbnail_extensions.each do |ite|
      begin
        @user.thumbnail = ite
        assert true
      rescue
        assert false, "#{ite} thumbnail extension invalid"
      end
    end
  end

end
