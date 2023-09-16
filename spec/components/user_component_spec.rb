# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserComponent, type: :component do
  it 'render show user' do
    render_inline(
      described_class.new(user: User.new(name: "Sakurai", email: "email@example.com"))
    )
    expect(page).to have_selector "ul > li:first-child", text: "Sakurai"
    expect(page).to have_selector "ul > li:last-child", text: "email@example.com"
  end
end
