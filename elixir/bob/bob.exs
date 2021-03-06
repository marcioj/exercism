defmodule Teenager do
  def hey(input) do
    cond do
      input == "" -> "Fine. Be that way."
      String.upcase(input) == input -> "Woah, chill out!"
      String.ends_with? input, "?" -> "Sure."
      true -> "Whatever."
    end
  end
end
