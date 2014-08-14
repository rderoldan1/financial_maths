require "financial_maths/version"

module FinancialMaths

  def due_variable_payment_amortization(periods, amount, rate,  payment)
    result = []
    result << {:period=> 0, :monthly_payment => nil, :interest => nil, :payment => nil, :balance => amount}

    for i in 1..periods
      interest = amount * rate
      month_payment = payment + interest
      if i == periods
        amount -= amount
      else
        amount -= payment
      end
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
      if i == periods
        amount -= amount
      else
        amount -= payment
      end

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
      if i == periods
        amount -= amount
      else
        amount -= month_payment
      end
      
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
    result << {:period=> 0, :monthly_payment => nil,
               :interest => amount * rate, :payment => nil,
               :balance => amount}

    for i in 1..periods
      month_payment = payment * ((1-rate) ** (periods - i))
      interest = payment - month_payment
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
  
  def due_interest_amortization(periods, amount, rate)
    result = []
    result << {:period=> 0, :monthly_payment => nil, :interest => nil, :payment => nil, :balance => amount}
    
    for i in 1..(periods - 1) do  
      result << {period: i, monthly_payment: 0, interest: (amount * rate), payment: (amount * rate), balance: amount}
    end 

    result << {period: periods, monthly_payment: amount , interest: amount * rate, payment: amount * rate + amount, balance: 0}
  end 
  
  def anticipated_interest_amortization(periods, amount, rate)
    result = []
  
    for i in 0..(periods - 2) do  
      result << {period: i, monthly_payment: 0, interest: (amount * rate), payment: (amount * rate), balance: 0}
    end 

    result << {period: periods - 1, monthly_payment: amount , interest: amount * rate, payment: amount * rate + amount, balance: 0}
  end 
  
  def unique_payment_amortization(periods, amount, rate)
    result = []
    result << {:period=> 0, :monthly_payment => nil, :interest => nil, :payment => nil, :balance => amount}
    
    interest = (amount * rate) * periods
    
    for i in 1..(periods - 1) do  
      result << {:period=> i, :monthly_payment => 0, :interest => 0, :payment => 0, :balance => amount}
    end 
    
    result << {:period=> periods, :monthly_payment => amount, :interest => interest, :payment => amount + interest , :balance => 0}
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

    ##
    # Description:  Find nominal rate anticipated given effective rate - EFNV
    # Formulas:
    #               nominalRate   = (1 + EFFECTIVE RATE)^(1 / PERIODS) - 1
    #               toAnticipated =  nominalRate / 1 + nominalRate
    #               Returned      -> toAnticipated * PERIODS
    def nominal_anticipated_given_efective(effective_rate, periods)
      nominalRate = (1+(effective_rate.to_f/100))**(1/periods.to_f)-1
      toAnticipated = nominalRate / (1+nominalRate)
      (toAnticipated * periods.to_f * 100).round(4)
    end

    ##
    # Description:  Find nominal rate expired given effective rate - HCUA
    # Formula:      ((1 + EFFECTIVE RATE) ^ (1 / PERIODS) - 1)* PERIODS
    def nominal_due_given_efective(effective_rate, periods)
			((((1 + (effective_rate.to_f/100))**(1/periods.to_f)-1)*periods.to_f)*100).round(4)
    end

		##
		# Description:  Find nominal rate expired given effective rate - EFNV
		# Formula:      (1 - ((1 / (TASA EFECTIVA + 1))^(1/PERIODOS))
		def anticipated_interest(rate, periods)
		  (1 - (( 1 / ( rate.to_f + 1 )) ** (1.0 / periods)))
		end

  # == End conversion rates

  # Hallar la cuota fija anticipada   HCFA
  def anticipated_fixed_payment(present_value, rate, term)
		((present_value.to_f) / ((1 - (1 - rate.to_f ) ** term ) / rate.to_f )).round(4)
  end

  def variable_payment(amount, periods)
    amount.to_f / periods
  end

end
