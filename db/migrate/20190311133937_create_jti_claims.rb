class CreateJtiClaims < ActiveRecord::Migration[5.2]
  def change
    create_table :jti_claims do |t|
      t.references :user, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
