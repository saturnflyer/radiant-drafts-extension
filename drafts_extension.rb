class DraftsExtension < Radiant::Extension
  version "1.0"
  description "Provides the ability to write drafts for page parts."
  url "http://saturnflyer.com/"
  
  def activate
    PagePart.class_eval{
      include PagePartAdditionsForDrafts
    }
    
    if admin.page.edit
      admin.page.edit.add :part_controls, 'draft_controls'
      admin.page.edit.add :part_controls, 'page_part_draft'
    end
  end
  
end