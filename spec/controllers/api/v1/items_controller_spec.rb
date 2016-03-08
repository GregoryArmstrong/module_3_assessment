require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  scenario "GET Api::V1::Items#Index" do
    Item.create(name: "testname",
                description: "testdescription",
                image_url: "test_url.com"
                )
    get :index, format: :json

    expect(response.status).to eq(200)
    expect(response.content_type).to eq "application/json"

    items = JSON.parse(response.body)

    expect(items).to have_content("name")
    expect(items).to have_content("description")
    expect(items).to have_content("image_url")
    expect(items).to_not have_content("updated_at")
    expect(items).to_not have_content("created_at")
  end

  scenario "GET Api::V1::Items#show" do
    item_1 = Item.create(name: "test_name",
                         description: "test_description",
                         image_url: "test_url.com"
                         )
    item_2 = Item.create(name: "not_name",
                         description: "not_description",
                         image_url: "not_url.com"
                         )
    get :show, format: :json, id: item_1.id

    expect(response.status).to eq(200)
    expect(response.content_type).to eq "application/json"

    item = JSON.parse(response.body)

    expect(item).to have_content("test_name")
    expect(item).to have_content("test_description")
    expect(item).to have_content("test_url.com")
    expect(item).to_not have_content("updated_at")
    expect(item).to_not have_content("created_at")
    expect(item).to_not have_content("not_name")
    expect(item).to_not have_content("not_description")
    expect(item).to_not have_content("not_url.com")
  end

  scenario "DELETE Api::V1:Items#destroy" do
    item_1 = Item.create(name: "test_name",
                         description: "test_description",
                         image_url: "test_url.com"
                         )

    delete :destroy, id: item_1.id

    expect(response.status).to eq(204)
  end
end
