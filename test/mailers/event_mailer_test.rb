require 'test_helper'

class EventMailerTest < ActionMailer::TestCase
  test "share_event" do
    mail = EventMailer.share_event
    assert_equal "Share event", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
