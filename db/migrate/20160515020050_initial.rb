class Initial < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.boolean :permits_ties, :default => true

      t.timestamps
    end

    create_table :teams do |t|
      t.string :name

      t.integer :league_id

      t.timestamps
    end

    create_table :results do |t|

      t.datetime :date

      t.integer :league_id

      t.timestamps
    end

    create_table :result_participants do |t|

      t.column :status, :integer, default: 0

      t.integer :result_id
      t.integer :team_id

      t.timestamps
    end

    add_index :teams, :league_id
    add_index :results, :league_id
    add_index :result_participants, :result_id
    add_index :result_participants, :team_id

  end
end
