require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the LeadsHelper. For example:
#
# describe LeadsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe LeadsHelper do
  describe "human date" do
    it "shows full date if last year" do
      helper.human_time(Time.mktime(2000,1,3)).should == "03 Jan 2000"
    end

    it "shows day, month if this year" do
      helper.human_time(Time.mktime(Time.now.year,1,3)).should == "03 Jan"
    end

    it "shows day, month if 7 days ago" do
      seven_days_ago = Time.now-(7*24*60*60)
      helper.human_time(seven_days_ago).should == seven_days_ago.strftime("%d %b")
    end

    it "shows weekday if 6 days ago" do
      six_days_ago = Time.now-(6*24*60*60)
      helper.human_time(six_days_ago).should == six_days_ago.strftime("%A")
    end

    it "shows weekday if 2 days ago" do
      two_days_ago = Time.now-(2*24*60*60)
      helper.human_time(two_days_ago).should == two_days_ago.strftime("%A")
    end

    it "shows yesterday if yesterday" do
      yesterday = Time.now-(24*60*60)
      helper.human_time(yesterday).should == 'yesterday'
    end

    it "shows time if since yesterday" do
      one_hour_ago = Time.now-(60*60)
      helper.human_time(one_hour_ago).should == one_hour_ago.strftime("%H:%M")
    end
  end
end
