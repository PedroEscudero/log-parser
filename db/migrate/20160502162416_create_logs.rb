class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs, id: false do |t|
      t.string :uuid, null: false
      t.string :ip
      t.string :parameters
      t.string :url
      t.string :result
      t.string :method
      t.datetime :time
      t.string :warning
      t.string :error
      t.timestamps null: false
    end
  end
end
