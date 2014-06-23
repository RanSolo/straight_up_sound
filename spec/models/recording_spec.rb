require 'spec_helper'

describe Recording do
    it { should belong_to :song }
    it { should validate_presence_of :name   }
    it { should respond_to(:file) }
  end
