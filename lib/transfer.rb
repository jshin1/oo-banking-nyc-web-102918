class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@all << self
  end

  def valid?
    sender.valid? == true && receiver.valid? == true ? true : false
  end

  def execute_transaction
    if sender.balance <= amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      @method ||= method
    end
  end

  def method
    sender.balance -= amount
    receiver.balance += amount
    @status = "complete"
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end
end
