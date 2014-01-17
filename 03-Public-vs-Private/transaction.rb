class Transaction
  def initialize(amount, date)

    @amount = amount
    @date = date.strftime("%m/%d/%Y") 

  end
  
  def to_s
     "Vous avez realise une operation de #{@amount} euros, le #{@date}"	
  end
end
