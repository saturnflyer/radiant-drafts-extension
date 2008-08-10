module DraftTags
  include Radiant::Taggable
  
  desc %{
    Renders the draft content of a page and works just like the r:content tag.

    *Usage:*
    <pre><code><r:draft [part="part_name"] [inherit="true|false"] [contextual="true|false"] /></code></pre>
  }
  tag "draft" do |tag|
    page = tag.locals.page
    part_name = tag_part_name(tag)
    boolean_attr = proc do |attribute_name, default|
      attribute = (tag.attr[attribute_name] || default).to_s
      raise TagError.new(%{`#{attribute_name}' attribute of `draft' tag must be set to either "true" or "false"}) unless attribute =~ /true|false/i
      (attribute.downcase == 'true') ? true : false
    end
    inherit = boolean_attr['inherit', false]
    part_page = page
    if inherit
      while (part_page.part(part_name).draft.nil? and (not part_page.parent.nil?)) do
        part_page = part_page.parent
      end
    end
    contextual = boolean_attr['contextual', true]
    draft = part_page.part(part_name).draft
    tag.locals.page = part_page unless contextual
    tag.globals.page.render_snippet(draft) unless draft.nil?
  end
end