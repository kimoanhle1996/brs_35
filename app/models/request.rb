class Request < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  scope :request_user, ->(id){where user_id: id }
end
