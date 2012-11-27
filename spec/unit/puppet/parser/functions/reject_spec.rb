#!/usr/bin/env rspec
require 'spec_helper'

describe "the reject function" do
  before :all do
    Puppet::Parser::Functions.autoloader.loadall
  end

  before :each do
    @scope = Puppet::Parser::Scope.new
  end

  it "should exist" do
    Puppet::Parser::Functions.function("reject").should == "function_reject"
  end

  it "should raise a ParseError if there is less than 1 arguments" do
    lambda { @scope.function_reject([]) }.should( raise_error(Puppet::ParseError))
  end

  it "should reject contents from an array" do
    result = @scope.function_grep([["1111", "aaabbb","bbbccc","dddeee"], "bbb"])
    result.should(eq(["dddeee"]))
  end

end
