class AddCartIdToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :cart, index: true
  end
end
