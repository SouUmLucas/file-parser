class CreateImportFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :import_files do |t|
      t.string :file_name

      t.timestamps
    end
  end
end
