require 'rails_helper'

describe Week, type: :model do
  it { should have_valid(:number).when(1) }
  it { should_not have_valid(:number).when(nil, "") }
end
