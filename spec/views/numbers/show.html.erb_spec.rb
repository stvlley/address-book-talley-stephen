require 'rails_helper'

RSpec.describe "numbers/show", type: :view do
  before(:each) do
    assign(:number, Number.create!(
      phone_number: "",
      comment: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
