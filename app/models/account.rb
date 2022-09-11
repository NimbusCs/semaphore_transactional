class Account < ApplicationRecord
    belongs_to :user
    serialize :meta_data
end
