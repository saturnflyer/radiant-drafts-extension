module PagePartAdditionsForDrafts
  def self.included(base)
    base.class_eval {
      has_one :page_part_draft
      
      def has_draft?
        page_part_draft?
      end
      
      alias_method :draft, :page_part_draft
    }
  end
  module InstanceMethods
  end
end