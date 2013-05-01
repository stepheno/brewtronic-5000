require 'spec_helper'

describe Hop do

  before(:all) do
    Fabricate(:hop)
  end

  it { should validate_presence_of(:alpha) }
  it { should validate_presence_of(:hsi) }

end
