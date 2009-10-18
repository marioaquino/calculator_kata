require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Calculator" do
  it "should blow up if a non-string expression is supplied" do
    lambda { Calculator::calculate(2) }.should raise_error(ArgumentError)
  end
  
  it "should handle simple addition" do
    Calculator::calculate("2 + 3").should == "5"
  end
  
  it "should handle simple subtraction" do
    Calculator::calculate("3 - 1").should == "2"
  end
  
  it "should handle addition and subtraction combined" do
    Calculator::calculate("3 - 1 + 24 + 5 - 6").should == "25"
  end
  
  it "should handle simple multiplication" do
    Calculator::calculate("3 * 2").should == "6"
  end
  
  it "should handle simple division" do
    Calculator::calculate("6 / 3").should == "2"
  end
end
