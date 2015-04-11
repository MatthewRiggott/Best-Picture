require 'rails_helper'

RSpec.describe "contests/show", type: :view do
  before(:each) do
    @contest = assign(:contest, Contest.create!(
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
  end
end
