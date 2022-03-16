defmodule AnonFunctions.SecretsTest do
  use ExUnit.Case
  alias AnonFunctions.Secrets

  test "secret_add add 3" do
    add = Secrets.secret_add(3)
    assert add.(3) === 6
  end

  test "secret_subtract subtract 3" do
    subtract = Secrets.secret_subtract(3)
    assert subtract.(6) === 3
  end

  test "secret_multiply multiply by 3" do
    multiply = Secrets.secret_multiply(3)
    assert multiply.(6) === 18
  end

  test "secret_divide devided by 3" do
    divide = Secrets.secret_divide(3)
    assert divide.(6) === 2
  end

  test "secret_combine 100 multiply by 2 then subtract 20" do
    multiply = Secrets.secret_multiply(2)
    subtract = Secrets.secret_subtract(20)
    combine = Secrets.secret_combine(multiply, subtract)
    assert combine.(100) == 180
  end

  test "secret_combine 32 divide by 3 then add 5" do
    divide = Secrets.secret_divide(3)
    add = Secrets.secret_add(5)
    combine = Secrets.secret_combine(divide, add)
    assert combine.(32) === 15
  end
end
