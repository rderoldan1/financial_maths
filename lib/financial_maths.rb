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

  # hallar tasa efectiva dado la tasa nominal vencida  NVEF
  def efective_given_nominal_due(nominal_rate, term)
    (((1 + nominal_rate.to_f) ** term)-1).round(4)
  end

  # hallar tasa efectiva dado la tasa nominal anticipada    NAEF
  def efective_given_nominal_antipipated(nominal_rate, term)
    (1 / ((1 -  nominal_rate.to_f) ** term)).round(4) - 1
  end

  # hallar tasa nominal anticipada dado efectiva   EFNV
  def nominal_antipiated_given_efective(nominal_rate, term)
    (1 - (1 / (1 +  nominal_rate.to_f) ** (1 / term))).round(4)
  end

  # hallar tasa nominal anticipada dado efectiva   EFNV
  def nominal_due_given_efective(nominal_rate, term)
    ((nominal_rate.to_f + 1) ** (1 / term)).round(4)
  end
  # Hallar la cuota fija anticipada   HCFA
  def anticipated_fixed_payment(present_value, rate, term)
    ((present_value.to_f * rate.to_f) / ((rate.to_f + 1) - (1 / (1 + rate) ** (term - 1)))).round(4)
  end

  def variable_payment(amount, periods)
    amount.to_f / periods
  end


end


