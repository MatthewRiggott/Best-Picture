require 'rails_helper'

RSpec.describe "contests/new", type: :view do
  before(:each) do
    assign(:contest, Contest.new(
      :user_id => 1
    ))
  end

  it "renders new contest form" do
    render

    assert_select "form[action=?][method=?]", contests_path, "post" do

      assert_select "input#contest_user_id[name=?]", "contest[user_id]"
    end
  end
end
