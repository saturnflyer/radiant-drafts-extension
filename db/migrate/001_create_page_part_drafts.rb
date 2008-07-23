class CreatePagePartDrafts < ActiveRecord::Migration
  def self.up
    create_table :page_part_drafts do |t|
      t.integer :page_part_id
      t.string :filter_id, :limit => 25
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :page_part_drafts
  end
end
