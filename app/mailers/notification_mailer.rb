# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  def notify
    @import = params[:import]

    mail(to: params[:email], subject: I18n.t("email_subjects.files_processed"))
  end
end
