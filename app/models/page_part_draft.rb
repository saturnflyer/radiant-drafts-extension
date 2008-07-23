class PagePartDraft < ActiveRecord::Base
  validates_presence_of :page_part_id
  validates_length_of :filter_id, :within => 0..25, :message => 'may not be longer than 25 characters'
end
