namespace :run_transactions do
  desc "Run all Pending Transactions"
  task pending_transactions: :environment do
    include AccountsHelper
    transactions = Transaction.where(status: 0)
    if transactions.present?
      
      transactions.each do |tx|
        sender = Account.find_by(code: tx.sender_code)
        receiver = Account.find_by(code: tx.receiver_code)
        if check_balance(sender.balance,tx.amount)
          sender.balance -= tx.amount
          receiver.balance += tx.amount
          if sender.save && receiver.save
            tx.update(status: 1)
          end
        else
          tx.update(status: 2, meta_data: {'status_updated' => 'Canceled due to insufficient balance'})
        end
      end
      
    end
  end
end
