# Bank Account

A simulated tech test for Makers Academy week 10.

### Objective

Build a simple bank account app that can track a balance, handle deposits and
withdrawals and print a simple statement to the console. The statement includes
the amount deposited or withdrawn along with the current balance after the transaction
and the date and time of the transaction.

### How To Use:

#### Methods

`Class::Account`

`#withdraw`

this method withdraws the amount passed as an argument from `@balance`, also runs
`add_transaction` on the account's `Statement` which creates a `Transaction` object
with details of the transaction.

`#deposit`

deposits the amount passed as an argument and also runs `add_transaction` on the
account's statement in a similar manner to `#withdraw`.

`#print_statement`

runs `Statement#print_statement` on the account's statement which prints a table
with recent transactions.

`Class::Transaction`

Instances of this class store various details about an individual transaction.
These include the amount deposited or withdrawn, the type of transaction and the
balance of the account after the transaction. Instances are stored in an account's
`Statement` instance.

`Class::Statement`

Stores instances of the `Transaction` class, and provides a method which uses the
`terminal-table` gem to generate a pretty table to print when `print_statement` is
called.

#### Example of a printed statement:

```
+----------+-----------+-----------+---------+
| Date     | Deposited | Withdrawn | Balance |
| 05/22/18 |           | $-25.00   | $25.00  |
| 05/22/18 | $50.00    |           | $50.00  |
+----------+-----------+-----------+---------+
```


### Tech

Written in plain Ruby, using Rspec for testing.

Money values are stored using the Money gem, which provides a bunch of useful
methods, along with removing the rounding errors that occur when storing money
values as floats. It also supports different currencies which would allow
easy implementation of that feature in the future.
