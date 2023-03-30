# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'

    create_table :reservations, id: :uuid do |t|
      t.string :name, null: false
      t.string :phone_number
      t.string :email, null: false
      t.integer :number_of_people, null: false
      t.datetime :estimated_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
