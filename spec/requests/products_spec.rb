
require "spec_helper"



describe "Products" do



#before(:all) {let(:product) {FactoryGirl.create(:product)}
before(:all) do
  @product = FactoryGirl.create(:product)
end
after(:all)  { Product.delete_all }

before(:each) do
    @driver = Selenium::WebDriver.for :firefox
    @base_url = "http://localhost:3000"
    @driver.manage.timeouts.implicit_wait = 30
    @verification_errors = []

  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "test_products" do
    @driver.get(@base_url + "/")
    @driver.find_element(:link, "New Product").click
    @driver.find_element(:id, "product_name").clear
    @driver.find_element(:id, "product_name").send_keys @product.name.to_s
    @driver.find_element(:name, "commit").click
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    @driver.find_element(:link, "Back").click
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
    # ERROR: Caught exception [ERROR: Unsupported command [isTextPresent]]
  end
  it "tests_delete" do
    puts @product.id
    @driver.get(@base_url)
    @driver.find_element(:xpath,"//a[@href='/products/#{@product.id}'][contains(@data-method,'delete')]").click
    @driver.switch_to.alert.accept

  end


  def element_present?(how, what)
    @driver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
end
