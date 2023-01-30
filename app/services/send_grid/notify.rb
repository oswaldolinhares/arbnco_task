# frozen_string_literal: true

module SendGrid
  class Notify < ApplicationService
    attr_reader :import, :email

    def initialize(import, email)
      super()
      @import = import
      @email = email
    end

    def call
      NotificationMailer.with(import: import, email: email)
                        .notify.deliver_now
    end
  end
end
