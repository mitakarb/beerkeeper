# frozen_string_literal: true

require "rails_helper"

RSpec.describe AlertComponent, type: :component do
  it 'render success alert' do
    render_inline(
      described_class.new(message_type: "success", message: "success message")
    )
    expect(page).to have_selector ".flash-success", text: "success message"
    expect(page).not_to have_selector ".flash-warning"
  end

  it 'render warning alert' do
    render_inline(
      described_class.new(message_type: "warning", message: "warning message")
    )
    expect(page).to have_selector ".flash-warn", text: "warning message"
  end

  it 'render danger alert' do
    render_inline(
      described_class.new(message_type: "danger", message: "danger message")
    )
    expect(page).to have_selector ".flash-error", text: "danger message"
  end
end
