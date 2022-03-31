require 'rails_helper'

RSpec.describe "Pages", type: :request do
  fixtures :exercises, :routines
  describe "GET /home" do
    before { get root_path }

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns content on body" do
      expect(response.body).to include(*Routine.all.pluck(:name))
    end
  end
end
