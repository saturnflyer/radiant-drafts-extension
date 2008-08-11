module PagePartAdditionsForDrafts
  def self.included(base)
    base.class_eval {
      has_one :page_part_draft
      
      alias_method :draft, :page_part_draft
      
      include InstanceMethods
    }
  end
  module InstanceMethods
    
    def draft=(details)
      puts details
      unless draft.nil?
        draft.update_attribute('content', details)
      else
        @draft = PagePartDraft.new(:content => details, :page_part_id => self.id, :filter_id => self.filter_id)
        draft = @draft
        draft.save!
      end
    end
  end
end