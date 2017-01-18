require 'rails_helper'

describe "Navigating rooms" do
  before { login_as user }

  let(:user) { create :user }
  let!(:room) { create :room, user: user }

  it "allows navigation from the listing page to the detail page" do
    visit rooms_url

    click_link "View"

    expect(current_path).to eq(room_path(room))
  end
end
