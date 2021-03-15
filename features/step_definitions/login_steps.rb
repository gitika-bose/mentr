require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /the following users exists/ do |user_table|
    user_table.hashes.each do |user|
        User.create(email: user["email"], password: user["password"])
    end
end

Given /^(?:|I )am on (.+)$/ do |page_name|
    visit path_to(page_name)
  end

#When /^(?:|I )sign in with correct credentials$/ do
#end

Then /^(?:|I )should be on (.+)$/ do |page_name|
    current_path = URI.parse(current_url).path
    if current_path.respond_to? :should
      current_path.should == path_to(page_name)
    else
      assert_equal path_to(page_name), current_path
    end
end

Then /(.*) seed users should exist/ do | n_seeds |
    User.count.should be n_seeds.to_i
end