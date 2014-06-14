require 'spec_helper'
require 'user'
describe User do
  it { should have_many :songs }
  it { should validate_uniqueness_of :email }
  it { should validate_uniqueness_of :username }
end
