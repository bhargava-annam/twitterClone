class Reply < ApplicationRecord
  # Scopes
  default_scope {order(created_at: :desc)}
  belongs_to :post
end
