require 'spec_helper'

describe Lead do
  it "should delete notes when deleted" do
    lead = Lead.create(:contact => "Fred Willis")
    lead.notes.create(:body => "Note 1")
    lead.notes.create(:body => "Note 2")
    Note.count.should == 2
    lead.destroy
    Note.count.should == 0
    Lead.count.should == 0
  end
end
