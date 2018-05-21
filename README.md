# Bank Account

A simulated tech test for Makers Academy week 10.

### Objective

Build a simple bank account app that can track a balance, handle deposits and
withdrawals and print a simple statement to the console. The statement includes
the amount deposited or withdrawn along with the current balance after the transaction
and the date and time of the transaction.

### How To Use:

#### Methods

`#withdraw` this method withdraws the amount passed as an argument from `@balance`



### Tech

Written in plain Ruby, using Rspec for testing.

Money values are stored using the Money gem, which provides a bunch of useful
methods, along with removing the rounding errors that occur when storing money
values as floats. It also supports different currencies which would allow
easy implementation of that feature in the future.
