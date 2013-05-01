require 'spec_helper'

describe User do

  before(:all) do
    Fabricate(:user)
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:email) }

  #context 'messages' do
    #it "should create a message to someone" do
      #from_user = Fabricate(:user)
      #to_user   = Fabricate(:user)
      #body = 'Hello, world!'

      #from_user.sent_messages.count.should eq 0
      #to_user.messages.count.should eq 0

      #Message.create(
        #from_user: from_user,
        #to_user: to_user,
        #body: body
      #)

      #from_user.sent_messages.count.should eq 1
      #to_user.messages.count.should eq 1
      #Message.count.should eq 1
    #end
  #end

end
