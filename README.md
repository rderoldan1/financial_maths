# FinancialMaths

more functions will be added soon

#### New in version 0.0.3

   1. future_given_present
   2. present_given_future
   3. annuity_given_present
   4. annuity_given_future
   5. present_given_annuity(
   6. future_given_annuity

#### Pending
   1. include more functions
   3. add some test units

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

### Calculate Fixed payment equity
A credit in a period of 15 years, the amount is $100.000.000 and the interest is 1.44594763%, 
call the method following the next instruction.
	
```ruby
fixed_payment_equity(15,100000000,0.0144594763)
```
The result is a hash with the plan of payments, it looks like that
	
	[{:period=>0, :monthly_payment=>nil, :interest=>nil, :payment=>nil, :balance=>100000000}, 
	{:period=>1, :payment=>2001502.63, :interest=>1445947.63, :monthly_payment=>555555, :balance=>99444445},
	{:period=>2, :payment=>1993469.5956441534, :interest=>1437914.5956441534, :monthly_payment=>555555, :balance=>98888890},
	...
	..
	.
	]

The lists of the methods and they params

  future_given_present(present_value, interest, term)
  present_given_future(future_value, interest, term)
  annuity_given_present(present_value, interest, term)
  annuity_given_future(future_value, interest, term)
  present_given_annuity(annuity, interest, term)
  future_given_annuity(annuity, interest, term)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
