class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :messate, presence: true, length: {maximam: 140}
end
