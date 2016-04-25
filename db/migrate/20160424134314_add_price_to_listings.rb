class AddPriceToListings < ActiveRecord::Migration
  def change
    add_column :listings, :'price, :decimal10'
  end
end
