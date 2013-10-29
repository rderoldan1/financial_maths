require "financial_maths/version"

module FinancialMaths

  def due_variable_payment_amortization(periods, amount, rate,  payment)
    result = []
    result << {:period=> 0, :monthly_payment => nil, :interest => nil, :payment => nil, :balance => amount}

    for i in 1..periods
      interest = amount * rate
      month_payment = payment + interest
      amount -= payment
      #date += 1
      result << {:period=> i,
                 :payment => month_payment,
                 :interest => interest,
                 :monthly_payment => payment,
                 :balance => amount}
    end
    result
  end

  def anticipated_variable_payment_amortization(periods, amount, rate,  payment)
        result = []
    #result << {:period=> 0, :monthly_payment => nil, :interest => nil, :payment => nil, :balance => amount}

    for i in 0..periods-1
      interest = amount * rate
      month_payment = payment + interest
      amount -= payment
      #date += 1
      result << {:period=> i,
                 :payment => month_payment,
                 :interest => interest,
                 :monthly_payment => payment,
                 :balance => amount}
    end
    result
  end


  def due_fixed_payment_amortization(periods, amount, rate, payment)
    result = []
    result << {:period=> 0, :monthly_payment => nil, :interest => nil, :payment => nil, :balance => amount}

    for i in 1..periods
      interest = amount * rate
      month_payment = payment - interest
      amount -= month_payment
      #date += 1
      result << {:period=> i,
                 :payment => payment,
                 :interest => interest,
                 :monthly_payment => month_payment,
                 :balance => amount}
    end
    result
  end

  def anticipated_fixed_payment_amortization(periods, amount, rate, payment)
    result = []
    #result << {:period=> 0, :monthly_payment => nil, :interest => nil, :payment => nil, :balance => amount}

    for i in 0..periods-1
      interest = amount * rate
      month_payment = payment - interest
      amount -= month_payment
      #date += 1
      result << {:period=> i,
                 :payment => payment,
                 :interest => interest,
                 :monthly_payment => month_payment,
                 :balance => amount}
    end
    result
  end

  # hallar futuro dado el valor presente    HFDP
  def future_given_present(present_value, interest, term)
    (present_value.to_f * (1 + interest.to_f) ** term).round(4)
  end

  # hallar presente dado el futuro          HPDF
  def present_given_future(future_value, interest, term)
    (future_value.to_f / (1 +interest.to_f) ** term).round(4)
  end

  # hallar Anualidad dado el valor presente    HADP
  def annuity_given_present(present_value, interest, term)
    interest = interest.to_f
     (present_value.to_f * ((interest * (1+interest) ** term) / (((1 + interest) ** term) -1))).round(4)
  end

  # hallar anualidad dado el valor futuro      HADF
  def annuity_given_future(future_value, interest, term)
     (future_value.to_f * (interest.to_f / ((1 + interest) ** term)-1)).round(4)
  end

  # hallar presente dado la anualidad        HPDA
  def present_given_annuity(annuity, interest, term)
    (annuity.to_f * (((1 + interest.to_f) ** term) -1) / (interest.to_f * (1 + interest.to_f) ** term )).round(4)
  end

  # hallar futuro dado la anualidad          HFDA
  def future_given_annuity(annuity, interest, term)
    (annuity * (((1 + interest.to_f) ** term) -1) / interest.to_f ).round(4)
  end

  # == Conversion rates
  
    ## 
    # Description:  Find effective rate given nominal rate expired - NVEF
    # Formula:      ((1 + (NOMINAL RATE / PERIODS)) ^ PERIODS) - 1
    def efective_given_nominal_due(nominal_rate, term)
      ((((1+((nominal_rate.to_f/100)/term))**term)-1).round(6))*100
    end
    
    ##
    # Description:  Find effective rate given anticipated nominal rate - NAEF
    # Formula:      ((1 / ((1- (NOMINAL RATE / PERIODS)) ^ PERIODS)) -1
    def efective_given_nominal_anticipated(nominal_rate, term)
      (((1/((1-((nominal_rate.to_f/100)/term))**term))-1)*100).round(4)
    end
  
  # == End conversion rates
  
  # Hallar la cuota fija anticipada   HCFA
  def anticipated_fixed_payment(present_value, rate, term)
    ((present_value.to_f * rate.to_f) / ((rate.to_f + 1) - (1 / (1 + rate) ** (term - 1)))).round(4)
  end

  def variable_payment(amount, periods)
    amount.to_f / periods
  end

end


