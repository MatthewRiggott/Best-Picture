require 'rails_helper'

RSpec.describe "contests/index", type: :view do
  before(:each) do
    assign(:contests, [
      Contest.create!(
        :user_id => 1
      ),
      Contest.create!(
        :user_id => 1
      )
    ])
  end

  it "renders a list of contests" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
