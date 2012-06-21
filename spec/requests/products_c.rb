require "rubygems"
gem "rspec"
gem "selenium-client"
require "selenium/client"
require "spec_helper"

describe "products_spec" do
  attr_reader :selenium_driver
  alias :page :selenium_driver

  before(:all) do
    @verification_errors = []
    @selenium_driver = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "firefox",
      :url => "http://localhost:3001/",
      :timeout_in_second => 60
  end

  before(:each) do
    @selenium_driver.start_new_browser_session
  end
  
  append_after(:each) do
    @selenium_driver.close_current_browser_session
    @verification_errors.should == []
  end
  
  it "test_products_spec" do
    page.open "/"
    page.click "link=New Product"
    page.wait_for_page_to_load "30000"
    page.type "id=product_name", "MyString"
    page.click "name=commit"
    page.wait_for_page_to_load "30000"
    begin
        page.is_text_present("Product was successfully created.").should be_true
    rescue ExpectationNotMetError
        @verification_errors << $!
    end
    page.click "link=Back"
    page.wait_for_page_to_load "30000"
    begin
        page.is_text_present("Listing products").should be_true
    rescue ExpectationNotMetError
        @verification_errors << $!
    end
    begin
        page.is_text_present("MyString").should be_true
    rescue ExpectationNotMetError
        @verification_errors << $!
    end
  end
end
