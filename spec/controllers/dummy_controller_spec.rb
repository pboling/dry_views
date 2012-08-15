require 'spec_helper'

describe DummyController do

  render_views

  before(:each) do
    get :index
  end

  describe "CaptureHelper" do
    it "should be success" do
      response.should be_success
    end
    it "should render :main_content override" do
      response.body.should =~ /This is main_content override/m
    end
    it "should render :top_content default" do
      response.body.should =~ /This is default top_content/m
    end

  end

end

