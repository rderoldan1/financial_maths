## FinancialMaths [![Build Status](https://travis-ci.org/rderoldan1/financial_maths.png?branch=master)](https://travis-ci.org/rderoldan1/financial_maths)
more functions will be added soon

#### New in version 0.0.5
   1. New functions for loan amortizations
   2. New payments calculations
   3. New unit tests

#### Pending
   1. include more functions
   3. add some unit tests

## Installation

Add this line to your application's Gemfile:

    gem 'financial_maths'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install financial_maths

## Usage
```ruby
require "financial_maths"

include FinancialMaths

```

## The lists of the methods and their params

#### Variable amortization payment due
due_variable_payment_amortization (periods, amount, rate, payment)

    $ due_variable_payment_amortization(5,10000,1.8,2000)
    $ [{:period=>0, :monthly_payment=>nil, :interest=>nil, :payment=>nil, :balance=>10000},
     {:period=>1, :payment=>20000.0, :interest=>18000.0, :monthly_payment=>2000, :balance=>8000},
     {:period=>2, :payment=>16400.0, :interest=>14400.0, :monthly_payment=>2000, :balance=>6000},
     {:period=>3, :payment=>12800.0, :interest=>10800.0, :monthly_payment=>2000, :balance=>4000},
     {:period=>4, :payment=>9200.0, :interest=>7200.0, :monthly_payment=>2000, :balance=>2000},
     {:period=>5, :payment=>5600.0, :interest=>3600.0, :monthly_payment=>2000, :balance=>0}]


#### Variable payment amortization anticipated
anticipated_variable_payment_amortization (periods, amount, rate, payment)

    $ anticipated_variable_payment_amortization(5,10000,1.8,2000)
    $ [{:period=>0, :payment=>20000.0, :interest=>18000.0, :monthly_payment=>2000, :balance=>8000},
      {:period=>1, :payment=>16400.0, :interest=>14400.0, :monthly_payment=>2000, :balance=>6000},
      {:period=>2, :payment=>12800.0, :interest=>10800.0, :monthly_payment=>2000, :balance=>4000},
      {:period=>3, :payment=>9200.0, :interest=>7200.0, :monthly_payment=>2000, :balance=>2000},
      {:period=>4, :payment=>5600.0, :interest=>3600.0, :monthly_payment=>2000, :balance=>0}]

#### Amortization with fixed payment due
due_fixed_payment_amortization (periods, amount, rate, payment)

#### Variable payment amortization anticipated
anticipated_fixed_payment_amortization (periods, amount, rate, payment)

    $ due_fixed_payment_amortization(5,10000,1.8,2109)
    $ [{:period=>0, :monthly_payment=>nil, :interest=>nil, :payment=>nil, :balance=>10000},
      {:period=>1, :payment=>2109, :interest=>18000.0, :monthly_payment=>-15891.0, :balance=>25891.0},
      {:period=>2, :payment=>2109, :interest=>46603.8, :monthly_payment=>-44494.8, :balance=>70385.8},
      {:period=>3, :payment=>2109, :interest=>126694.44, :monthly_payment=>-124585.44, :balance=>194971.24},
      {:period=>4, :payment=>2109, :interest=>350948.232, :monthly_payment=>-348839.232, :balance=>543810.4720000001},
      {:period=>5, :payment=>2109, :interest=>978858.8496000002, :monthly_payment=>-976749.8496000002, :balance=>1520560.3216000004}]

#### Find future given the present value
future_given_present (present_value, interest, term)

    $ future_given_present(10000,1.8,5)
    $ 1721036.8

#### Find present given the future
present_given_future (future_value, interest, term)

    $ present_given_future(10000,1.8,5)
    $ 58.1045

#### Find annuity present value given
annuity_given_present (present_value, interest, term)

    $ annuity_given_present(10000,1.8,5)
    $ 18105.1994

#### Find the future value annuity given
annuity_given_future (future_value, interest, term)

#### Find present given the annuity
present_given_annuity (annuity, interest, term)

#### Find future given the annuity
future_given_annuity (annuity, interest, term)

#### Find effective rate given the nominal rate due
efective_given_nominal_due (nominal_rate, term)

#### Find effective rate given the nominal rate anticipated
efective_given_nominal_antipipated (nominal_rate, term)

#### Find effective nominal rate given anticipated
nominal_antipiated_given_efective (nominal_rate, term)

#### Find effective nominal rate given anticipated
nominal_due_given_efective (nominal_rate, term)

#### Find the fixed anticipated
anticipated_fixed_payment (present_value, rate, term)

#### Finding variable amount
variable_payment (amount, periods)

    $ variable_payment(10000,5)
    $ 2000.0

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
