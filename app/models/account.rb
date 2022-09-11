class Account < ApplicationRecord
    before_create :create_code
    belongs_to :user
    serialize :meta_data

    protected

    def create_code
        loop do
          self.code = SecureRandom.hex.upcase
          break unless self.class.exists?(:code => code)
        end
    end

end
