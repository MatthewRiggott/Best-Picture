require 'rails_helper'

RSpec.describe "contests/edit", type: :view do
  before(:each) do
    @contest = assign(:contest, Contest.create!(
      :user_id => 1
    ))
  end

  it "renders the edit contest form" do
    render

    assert_select "form[action=?][method=?]", contest_path(@contest), "post" do

      assert_select "input#contest_user_id[name=?]", "contest[user_id]"
    end
  end
end
