require "rails_helper"

RSpec.describe DryViewsController, type: :controller do

  render_views

  describe "content_for" do
    before(:each) do
      get :content_for
    end

    it "should be success" do
      expect(response).to be_success
    end
    it "should render :main_content override" do
      expect(response.body).to match(/This is main_content override/m)
    end
    it "should render :top_content override" do
      expect(response.body).to match(/This is top_content override/m)
    end
  end

  describe "content_for_with_default" do
    before(:each) do
      get :content_for_with_default
    end

    it "should be success" do
      expect(response).to be_success
    end
    it "should render action template in body" do
      expect(response.body).to match(/This is just an action template/m)
    end
    it "should render :main_content default" do
      expect(response.body).to match(/This is default main_content/m)
    end
    it "should render :top_content default" do
      expect(response.body).to match(/This is default top_content/m)
    end
  end

  describe "no_content_for" do
    before(:each) do
      get :no_content
    end

    it "should be success" do
      expect(response).to be_success
    end
    it "should not render :main_content default" do
      expect(response.body).not_to match(/This is main_content override/m)
    end
    it "should not render :main_content override" do
      expect(response.body).not_to match(/This is default main_content/m)
    end
    it "should not render :top_content default" do
      expect(response.body).not_to match(/This is top_content override/m)
    end
    it "should not render :top_content override" do
      expect(response.body).not_to match(/This is default top_content/m)
    end
  end

end

