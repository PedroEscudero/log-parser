require 'test_helper'

class ParserTest < ActiveSupport::TestCase

  let (:parser) {Parser.new(Rails.application.config.log_path)}
  
  test "New parser" do
    assert_equal(parser.path, 'log/sample.log')
    assert_equal(parser.allow_assets, false)
  end

  test "New parser that allow assets" do
    parser = Parser.new(Rails.application.config.log_path)
    assert_equal(parser.path, 'log/sample.log')
    assert_equal(parser.allow_assets, true)
  end

  test "Read from a parser" do
    parser.read
    assert_equal(Log.count, 159)
    assert_equal(Log.last.ip, '127.0.0.1')
    assert_equal(Log.last.uuid, "ff1c565f-7133-4eb7-ada9-69dbf65606d8")
    assert_equal(Log.last.result, "200 OK")
    assert_equal(Log.last.method, "GET")
  end

  test "Tail from a parser" do
    parser.tail
    assert_equal(Log.count, 159)
    assert_equal(Log.last.ip, '127.0.0.1')
    assert_equal(Log.last.uuid, "ff1c565f-7133-4eb7-ada9-69dbf65606d8")
    assert_equal(Log.last.result, "200 OK")
    assert_equal(Log.last.method, "GET")
  end


end