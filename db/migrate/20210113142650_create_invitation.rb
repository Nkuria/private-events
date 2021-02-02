class CreateInvitation < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end

    add_reference :events, :attendees, foreign_key: { to_table: :invitations }

    add_reference :users, :events_invited, foreign_key: { to_table: :invitations }
  end
end
