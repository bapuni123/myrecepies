require 'test_helper'

class ChefTest < ActiveSupport::TestCase

    def setup
        @chef = Chef.new(chefname: 'ashes', email: 'ashes@example.com')
    end

    test "should be valid" do
        assert @chef.valid?
    end

    test "name should be present" do
        @chef.chefname = " "
        assert_not @chef.valid?
    end

    test "name should be less than 30 characters" do
        @chef.chefname = "a" * 31
        assert_not @chef.valid?
    end

    test "email should be present" do
        @chef.chefname = " "
        assert_not @chef.valid?
    end

    test "email should be less than 255 characters" do
        @chef.email = "a" * 245 + "@example.com"
        assert_not @chef.valid?
    end

    test "email should accept correct format" do
        valid_emails = %w[user@example.com Ashes@gmail.com A.first@yahoo.ca john+smith@co.uk.org]
        valid_emails.each do |valids|
            @chef.email = valids
            assert @chef.valid?, "#{valids.inspect} should be valid"
        end
    end

    test "should reject invalid email address" do
        invalid_emails = %w[user@example, ashes@example,com ashes.name@gmail. john@bar+foo.com]
        invalid_emails.each do |invalids|
            @chef.email = invalids
            assert_not @chef.valid?, "#{invalids.inspect} should be invalid"
        end
    end

    test "email should be unique and case insensitive" do
        duplicate_chef = @chef.dup
        duplicate_chef.email = @chef.email.upcase
        @chef.save
        assert_not duplicate_chef.valid?   
    end

    test "email should be lower case before hitting db" do
        mixed_email = "JOHN@example.com"
        @chef.email = mixed_email
        @chef.save
        assert_equal mixed_email.downcase, @chef.reload.email
    end
    
end