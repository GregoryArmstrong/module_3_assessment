require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  scenario "GET Api::V1::Items#Index" do
    get :index

    expect(response.status).to eq(200)
    expect(response.content_type).to eq "application/json"

    items = response.body
    binding.pry
  end
end
