defmodule If.NameBadgeTest do
  use ExUnit.Case
  alias If.NameBadge

  test "print/3 prints the employee badge with full data" do
    expected = "[455] - Mary M. Brown - MARKETING"
    assert NameBadge.print(455, "Mary M. Brown", "MARKETING") == expected
  end

  test "print/3 uppercases the department" do
    expected = "[89] - Jack McGregor - PROCUREMENT"
    assert NameBadge.print(89, "Jack McGregor", "Procurement") == expected
  end

  test "print/3 prints the employee badge without id" do
    expected = "Barbara White - SECURITY"
    assert NameBadge.print(nil, "Barbara White", "Security") == expected
  end

  test "print/3 prints the owner badge" do
    expected = "[1] - Anna Johnson - OWNER"
    assert NameBadge.print(1, "Anna Johnson", nil) == expected
  end

  test "print/3 prints the owner badge without id" do
    expected = "Stephen Dann - OWNER"
    assert NameBadge.print(nil, "Stephen Dann", nil) == expected
  end
end
