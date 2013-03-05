require "financial_maths/version"

module FinancialMaths

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
      result << {:period=> i,
                 :payment => month_payment,
                 :interest => interest,
                 :monthly_payment => monthly_payments,
                 :balance => amount}
    end
    result
  end

  def fixed_payment_amortization(year, amount, year_interest)

  end

  # hallar futuro dado el valor presente
  def future_given_present(present_value, interest, term)
    (present_value.to_f * (1 + interest.to_f) ** term).round(4)
  end

  # hallar presente dado el futuro
  def present_given_future(future_value, interest, term)
    (future_value.to_f / (1 +interest.to_f) ** term).round(4)
  end

  # hallar Anualidad dado el valor presente
  def annuity_given_present(present_value, interest, term)
     (present_value.to_f * ((interest *(1+interest.to_f) ** term) / ((1 + interest.to_f) ** term) -1)).round(4)
  end

  # hallar anualidad dado el valor futuro
  def annuity_given_future(future_value, interest, term)
     (future_value.to_f * (interest.to_f / ((1 + interest) ** term)-1)).round(4)
  end

  # hallar presente dado la anualidad
  def present_given_annuity(annuity, interest, term)
    (annuity.to_f * (((1 + interest.to_f) ** term) -1) / (interest.to_f * (1 + interest.to_f) ** term )).round(4)
  end

  # hallar futuro dado la anualidad
  def future_given_annuity(annuity, interest, term)
    (annuity * (((1 + interest.to_f) ** term) -1) / interest.to_f ).round(4)
  end

end


