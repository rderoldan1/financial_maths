# FinancialMaths

TODO: Write a gem description

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

calculate = Credit.new
```

### Calculate Fixed payment equity
A credit in a period of 15 years, the amount is $100.000.000 and the interest is 1.44594763%, 
call the method following the next instruction.
	
```ruby
calculate.fixed_payment_equity(15,100000000,0.0144594763)
```
The result is a hash with the plan of payments, it looks like that
	
	[{:period=>0, :monthly_payment=>nil, :interest=>nil, :payment=>nil, :balance=>100000000}, 
	{:period=>1, :payment=>2001502.63, :interest=>1445947.63, :monthly_payment=>555555, :balance=>99444445},
	{:period=>2, :payment=>1993469.5956441534, :interest=>1437914.5956441534, :monthly_payment=>555555, :balance=>98888890},
	...
	..
	.
	]


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
