require 'rails_helper'

RSpec.describe Keyword, type: :model do
  it {should have_valid(:keyword).when("funny")}
  it {should_not have_valid(:keyword).when(nil, "")}
end
