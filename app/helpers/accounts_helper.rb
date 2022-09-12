module AccountsHelper

    def check_account(account_code,user = nil)
        data = { exist: false, balance: 0 }
        if user.present?
            user_account = user.accounts.find_by(code: account_code)
            if user_account.present?
                data[:exist] = true
                data[:balance] = user_account.balance
            end
        else 
            account = Account.find_by(code: account_code)
            if account.present?
                data[:exist] = true
                data[:balance] = account.balance
            end
        end
        return data
    end

    def check_balance(balance, amount)
        available = false
        if balance >= amount
          available = true
        end
        return available
    end

end
