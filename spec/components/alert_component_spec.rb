# frozen_string_literal: true

require "rails_helper"

RSpec.describe AlertComponent, type: :component do
  it 'render success alert' do
    render_inline(
      described_class.new(message_type: "notice", message: "success message")
    )
    expect(page).to have_selector ".alert-success", text: "success message"
    expect(page).not_to have_selector ".alert-danger"
  end

  it 'render danger alert' do
    render_inline(
      described_class.new(message_type: "danger", message: "danger message")
    )
    expect(page).to have_selector ".alert-danger", text: "danger message"
    expect(page).not_to have_selector ".alert-success"
  end
end
