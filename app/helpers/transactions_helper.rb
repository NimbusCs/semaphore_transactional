module TransactionsHelper
    include AccountsHelper

    def check_codes(request, codes)
        response = { done: false, errors: { } }
        if codes[:sender].present? && codes[:receiver].present?
            sender = check_account(codes[:sender], request[:user])
            if sender[:exist] && check_account(codes[:receiver])[:exist]
                if check_balance(sender[:balance],request[:amount])
                    response = true
                else
                    response[:errors] = { 'Accounts' => 'Insufficient balance' }
                end
            else
                response[:errors] = { 'Accounts' => 'Please check format of Accounts' }
            end
        end
        return response
    end

    def check_amount(amount)
        response = false
        if amount.is_a?(Numeric) && amount.to_d > 0
            response = true
        end
        return response
    end

    def validate_transaction(user, params)
        response = { done: false, errors: {} }
        check = check_codes({user: user, amount: params[:amount]}, { sender: params[:sender_code],  receiver: params[:receiver_code] })
        if check
            if check_amount(params[:amount])
                response[:done] = true
            else
                response[:errors] = 'The Amount most be Numeric and greater than zero'
            end
        else
            response[:errors] = check[:errors]
        end
        return response
    end

end
