class Account < ActiveRecord::Base
  after_commit :transaction_success 
  # This callback fires when the transaction succeeds.
  after_rollback :transaction_failed
  # This callback fires when the transaction fails.

  def transfer_funds_to(amount, target)
    self.balance -= amount
    target.balance += amount
    Account.transaction do
      raise "Transaction Failed" unless self.save && target.save && self.balance >0
    end
  end

private
  def transaction_success
    Rails.logger.info "Transfer succeed for Account #{self.to_param}"
  end

  def transaction_failed
    Rails.logger.warn "Transfer failed for Account #{self.to_param}"
  end end
