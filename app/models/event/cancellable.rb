module Event::Cancellable
  extend ActiveSupport::Concern

  included do
    has_one :cancellation, required: false
  end

  def cancelled?
    cancellation.present?
  end

  def cancelled_at
    cancellation.created_at if cancelled?
  end

  def cancel(reason = nil)
    create_cancellation(reason:) unless cancelled?
  end
end
