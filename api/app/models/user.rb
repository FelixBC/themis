class User < ApplicationRecord
  belongs_to :role
  belongs_to :zone
  belongs_to :group
end
