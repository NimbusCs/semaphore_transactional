class Transaction < ApplicationRecord
    before_create :create_tx_id
    belongs_to :user

    protected

    def create_tx_id
        loop do
          self.tx_id ="TX-#{SecureRandom.hex(5).upcase}-#{Time.now.strftime("%d%m%Y")}"
          break unless self.class.exists?(:tx_id => tx_id)
        end
    end
end
