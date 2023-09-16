# frozen_string_literal: true

class UserComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

end
