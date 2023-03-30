class AddIssuerToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :issuer, :string
  end
end
