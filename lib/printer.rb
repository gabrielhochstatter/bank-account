require 'money'
Money.use_i18n = false

class Printer

  def self.print_statement(statement)
    output_array = ["date || credit || debit || balance"]
    statement.transactions.each do |transaction|
      if transaction.type == :deposit
        row = "#{transaction.date} || #{transaction.change} || || #{transaction.final_balance}"
      else
        row = "#{transaction.date} || || #{transaction.change} || #{transaction.final_balance}"
      end
      output_array.insert(1, row)
    end
    puts output_array
  end
end
