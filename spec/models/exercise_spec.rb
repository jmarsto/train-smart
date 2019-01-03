require 'rails_helper'

describe Exercise, type: :model do
  it { should have_valid(:name).when("ARC") }
  it { should_not have_valid(:name).when(nil, "") }
end
