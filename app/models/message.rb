class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat

  # after_create_commit { MessageBroadcastJob.perform_later(self) }

  def timestamp_formatted
    created_at.strftime("%H:%M")
  end
end
