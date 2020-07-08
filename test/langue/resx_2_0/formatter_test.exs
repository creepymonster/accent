defmodule LangueTest.Formatter.Resx20 do
  use ExUnit.Case, async: true

  Code.require_file("expectation_test.exs", __DIR__)

  alias Langue.Formatter.Resx20

  @tests [
    Simple
  ]

  for test <- @tests, module = Module.concat(LangueTest.Formatter.Resx20.Expectation, test) do
    test "resx 2.0 #{test}" do
      {expected_parse, result_parse} = Accent.FormatterTestHelper.test_parse(unquote(module), Resx20)
      {expected_serialize, result_serialize} = Accent.FormatterTestHelper.test_serialize(unquote(module), Resx20)

      assert expected_parse == result_parse
      assert expected_serialize == result_serialize
    end
  end
end
