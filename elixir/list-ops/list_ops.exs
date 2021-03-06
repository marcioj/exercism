defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  # 
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.
 
  @spec count(list) :: non_neg_integer
  def count(list, count \\ 0)

  def count([_|tail], count) do
    count(tail, count+1)
  end

  def count([], count), do: count

  @spec reverse(list) :: list
  def reverse(list, acc \\ [])

  def reverse([head|tail], acc) do
    reverse(tail, [head | acc])
  end

  def reverse([], acc), do: acc

  @spec map(list, (any -> any)) :: list
  def map([head|tail], f) do
    [f.(head) | map(tail, f)]
  end

  def map([], _), do: []

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([head|tail], f) do
    if f.(head) do
      [head | filter(tail, f)]
    else
      filter(tail, f)
    end
  end

  def filter([], _), do: []

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([head|tail], acc, f) do
    reduce(tail, f.(head, acc), f)
  end

  def reduce([], acc, _), do: acc

  @spec append(list, list) :: list
  def append([head|tail], b ) do
    [head | append(tail, b)]
  end

  def append([], [head|tail]) do
    [head | append([], tail)]
  end

  def append([], []), do: []

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reverse(do_concat_first_depth(ll, []))
  end

  defp do_concat_first_depth([head|tail], acc) when is_list(head) do
    do_concat_first_depth(tail, do_concat(head, acc))
  end

  defp do_concat_first_depth([], acc), do: acc

  defp do_concat([head|tail], acc) do
    do_concat(tail, [head|acc])
  end

  defp do_concat([], acc), do: acc

end
