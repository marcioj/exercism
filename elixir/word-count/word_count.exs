defmodule Words do
  import String, only: [downcase: 1, split: 3, split: 2]
  import Dict, only: [update: 4]
  import Enum, only: [flat_map: 2]
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: HashDict.t
  def count(sentence) do
    words = sentence |> downcase |> split(~r/[^\w-]/u, trim: true) |> flat_map(&(split(&1, "_")))
    do_count(words, HashDict.new)
  end

  defp do_count([current_word | words], hash) do
    hash = update(hash, current_word, 1, &(&1+1))
    do_count(words, hash)
  end

  defp do_count([], hash) do
    hash
  end

end
