require 'rails_helper'

describe Day, type: :model do
  it { should have_valid(:name).when("Monday") }
  it { should_not have_valid(:name).when(nil, "") }
end
