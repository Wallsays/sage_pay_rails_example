class AddRelatedAuthCodeToSagePayTransactions < ActiveRecord::Migration
  def change
    add_column :sage_pay_transactions, :related_auth_code, :string
  end
end
