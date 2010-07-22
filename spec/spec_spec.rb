require File.expand_path('../../lib/spec',__FILE__)
describe "expect" do
  it "returns nothing on a true boolean" do
    expect true, 'this will always return true'
  end
  it "raises an error on a failure" do
    expect_raises ExpectationError do
      expect false
    end
  end
end

describe "expect_equals" do
  it "returns nothing on equal objects" do
    expect_equal 1,1
  end

  it "raises an error on failure" do
    expect_raises ExpectationError do
      expect_equal 1,2
    end
  end
end

describe "expect_raises" do
  it "returns nothing when an error is raised" do
    expect_raises ExpectationError do
      expect false
    end
  end

  it "raises an error if no error is raised" do
    expect_raises ExpectationError do
      expect_raises ExpectationError do
        expect true
      end
    end
  end
  it "raises an error if the wrong error is raised" do
    expect_raises ExpectationError do
      expect_raises IOError do
        expect true
      end
    end
  end
end
