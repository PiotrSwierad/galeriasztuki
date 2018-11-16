class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.text :about
      t.text :contact

      t.timestamps
    end
  end
end
