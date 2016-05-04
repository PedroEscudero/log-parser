require 'test_helper'

class LogTest < ActiveSupport::TestCase
  
  test "create GET object log" do
    parser = Parser.new('log/sample.log')
    parser.read
    assert_equal(Log.count, 159)
    assert_equal(Log.last.ip, '127.0.0.1')
    assert_equal(Log.last.uuid, "ff1c565f-7133-4eb7-ada9-69dbf65606d8")
    assert_equal(Log.last.result, "200 OK")
    assert_equal(Log.last.method, "GET")
    assert_equal(Log.last.url, "\"/api/series/search.json?q=spider-man\"")
  end

end
