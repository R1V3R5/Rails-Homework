require 'spec_helper'

describe Fruit do
  let(:fruit) { Fruit.new(name: '1') }

  subject { fruit }

  it { should be_valid }

  context 'validations' do
    let(:fruit) {Fruit.new}
    it { should_not be_valid }
  end
end
