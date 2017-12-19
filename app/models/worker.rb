class Worker < ApplicationRecord
  has_many :user_card_logs, as: :loggable
end