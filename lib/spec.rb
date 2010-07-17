class ExpectationError < StandardError
end

def expect_equal(expected,actual,message='')
  expect expected==actual, "#{expected.inspect} not equal to #{actual.inspect} #{", #{message}"}"
end

def expect(bool,message='')
  if !bool
    raise ExpectationError.new(message)
  else
    print '.'
  end
end

def expect_raises(exception)
  begin
    yield
    expect false, "expect_raises failed"
  rescue exception => e #expected
  end
end

def describe(message='')
  begin
    yield
  rescue ExpectationError => e
    puts "Failure: #{e.message} #{message}\n#{e.backtrace.join("\n")}"
  end
end

alias :it :describe
alias :context :describe
alias :before :describe
