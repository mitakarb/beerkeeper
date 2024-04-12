# frozen_string_literal: true

class AlertComponent < ViewComponent::Base
  def initialize(message_type:, message:)
    @message_type = message_type.to_sym
    @message = message
  end
end
