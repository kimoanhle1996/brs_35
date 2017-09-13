class Request < ApplicationRecord
  belongs_to :user
  scope :request_user, ->(id){where user_id: id}
end
