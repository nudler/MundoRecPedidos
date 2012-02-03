class CreateImagenPedidos < ActiveRecord::Migration
  def change
    create_table :imagen_pedidos do |t|
      t.integer :pedido_id

      t.timestamps
    end
  end
end
