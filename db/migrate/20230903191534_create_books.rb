class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :epub_file # Change the column name to match the CarrierWave uploader

      t.timestamps
    end
  end
end
