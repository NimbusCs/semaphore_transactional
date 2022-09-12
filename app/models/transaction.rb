class Transaction < ApplicationRecord
    before_create :create_tx_id
    belongs_to :user

    def status_text
        [[0,'Pending'],[1,'Completed'],[2,'Canceled']].find { |k,v| k == self.status }.last
    end

    def as_json(options={:except => []})
        super(options.merge!(methods: [:status_text]))
    end

    protected

    def create_tx_id
        loop do
          self.tx_id ="TX-#{SecureRandom.hex(5).upcase}-#{Time.now.strftime("%d%m%Y")}"
          break unless self.class.exists?(:tx_id => tx_id)
        end
    end
end
