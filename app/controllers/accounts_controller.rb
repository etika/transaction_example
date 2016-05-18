class AccountsController < ApplicationController
  def index
@account_a = Account.find_by_name("Etika")
@account_b = Account.find_by_name("Kanika")
transfer_amount=100
@account_a.transfer_funds_to(transfer_amount,@account_b)
  end
end
