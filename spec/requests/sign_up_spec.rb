require 'spec_helper'

describe "Sign up" do
  describe "GET /users/sign_up" do
    it "get a form" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get '/users/sign_up'
      response.should be_success
      assert_select "form"
      
      post '/users', :email => 'z@y.com', :password => 'secret'
      assert_redirect
    end
  end
end
