defmodule Atoms.LogLevelTest do
  use ExUnit.Case
  alias Atoms.LogLevel

  test "LogLevel.alert_recipient/2 fatal code sends alert to ops" do
    assert LogLevel.alert_recipient(5, false) == :ops
  end

  test "LogLevel.alert_recipient/2 error code sends alert to ops" do
    assert LogLevel.alert_recipient(4, false) == :ops
    assert LogLevel.alert_recipient(4, true) == :ops
  end

  test "LogLevel.alert_recipient/2 unknown code sends alert to dev team 1 for a legacy app" do
    assert LogLevel.alert_recipient(6, true) == :dev1
    assert LogLevel.alert_recipient(0, true) == :dev1
    assert LogLevel.alert_recipient(5, true) == :dev1
  end

  test "LogLevel.alert_recipient/2 unknown code sends alert to dev team 2" do
    assert LogLevel.alert_recipient(6, false) == :dev2
  end

  test "LogLevel.alert_recipient/2 trace code does not send alert" do
    refute LogLevel.alert_recipient(0, false)
  end

  test "LogLevel.alert_recipient/2 debug code does not send alert" do
    refute LogLevel.alert_recipient(1, true)
    refute LogLevel.alert_recipient(1, false)
  end

  test "LogLevel.alert_recipient/2 info code does not send alert" do
    refute LogLevel.alert_recipient(2, true)
    refute LogLevel.alert_recipient(2, false)
  end

  test "LogLevel.alert_recipient/2 warning code does not send alert" do
    refute LogLevel.alert_recipient(3, true)
    refute LogLevel.alert_recipient(3, false)
  end
end
