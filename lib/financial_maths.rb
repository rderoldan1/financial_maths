require "financial_maths/version"

module FinancialMaths
  class Credit
    def fixed_payment_equity(year, amount, year_interest)
      years = year*12
      monthly_payments = amount/years
      result = []
      result << {:period=> 0, :monthly_payment => nil, :interest => nil, :payment => nil, :balance => amount}

      for i in 1..years
        interest = amount * year_interest
        month_payment = monthly_payments + interest 
        amount -= monthly_payments
        #date += 1
        result << {:period=> i, :payment => month_payment, :interest => interest, :monthly_payment => monthly_payments, :balance => amount}
      end
      result
    end
  end
  
end
