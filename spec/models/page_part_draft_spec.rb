require File.dirname(__FILE__) + '/../spec_helper'

describe PagePartDraft do
  before(:each) do
    @page_part_draft = PagePartDraft.new(:page_part_id => 1)
  end

  it "should err without a page_part_id" do
    @page_part_draft.page_part_id = nil
    @page_part_draft.valid?
    @page_part_draft.errors.on(:page_part_id).should include("can't be blank")
  end
  
  it "has content" do
    @page_part_draft.respond_to?(:content).should be_true
  end
  
  it "has a filter_id" do
    @page_part_draft.respond_to?(:filter_id).should be_true
  end
  
  it "should err with a filter_id longer than 25 characters" do
    too_long_filter_id = 'x' * 26
    @page_part_draft.filter_id = too_long_filter_id
    @page_part_draft.valid?
    @page_part_draft.errors.on(:filter_id).should include('is too long (maximum is 25 characters)')
  end
end

describe PagePart do
  it "should have a draft" do
    @part = PagePart.new()
    @part.respond_to?(:has_draft?).should be_true
  end
end