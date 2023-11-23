class Subscription < ApplicationRecord
  enum :status, [:active, :inactive]
end
