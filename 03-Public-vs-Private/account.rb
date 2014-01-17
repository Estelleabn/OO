# This is how you define your own custom exception classes
require_relative 'transaction'

class DepositError < StandardError
end

class BankAccount
  
  # Contract for the BankAccount class
  # - you can access full owner's name and position, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account infos
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  
  attr_accessor :name, :position, :transactions
  MIN_DEPOSIT =  100
  
  def initialize(name, iban, initial_deposit, password)
    raise DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name, @iban = name, iban
    
    add_transaction(initial_deposit)
  end
    
  def withdraw(amount)
    add_transaction(-amount)
  end
  
  def deposit(amount)
    add_transaction(amount)
  end
  
  def transactions_history(args = {})
    if args[:password] == @password
      @transactions.each {|transaction| puts transaction}
    elsif args.empty?
      puts "No password"
    else
      puts "Wrong password"
    end
  end
  
  def iban
    @iban = @iban.gsub(/\D((\d{4})(\D))+(\w+)\D/, "**************")
  end
  
  def to_s
    "************ \n Owner: #{@name} \n IBAN: #{@iban} \n Position: #{position} \n ************"
  end
          
  private  
  
  def add_transaction(amount)
    @position += amount
    @transactions << Transaction.new(amount, Time.now)
  end
    
end

# TESTING YOUR BANK ACCOUNT

# In the outside world, create a new account for Bruce Lee
account = BankAccount.new("Bruce Lee", "FR14-2004-1010-0505-0001-3M02-606", 200, "brucelit")

# Accessible infos
puts account.name # => Bruce Lee
puts account.iban # => FR14**************606
puts account.position # => 200

# Nicely print account's infos (over-riding #to_s)
puts account  # =>  Owner: Bruce Lee
              #     IBAN: FR14**************606
              #     Current amount: 200 euros

# Make some transactions
account.withdraw(515) # => You've just withdrawn 515 euros
account.deposit(100) # => You've just made a 100 euros deposit
account.deposit(650) # => You've just made a 650 euros deposit

# Print transactions history with password
account.transactions_history(password: "brucelit") # => [200, -515, 100, 650]
account.transactions_history(password: "brucewayne") # => wrong password
account.transactions_history() # => no password given


# Check current position
puts account.position == 435 # => true

# Un-comment the following to test custom exception
begin
too_small_deposit = BankAccount.new("Poor Billy", "FR14-2004-1010-0505-0001-3M02-606", 50, "toopoor")
rescue DepositError => e
  puts e.message
end