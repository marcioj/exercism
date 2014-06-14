defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  # 
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.
 
  @spec count(list) :: non_neg_integer
  def count(l) do
    do_count(l, 0)
  end

  defp do_count([_|tail], count) do
    do_count(tail, count+1)
  end

  defp do_count([], count), do: count

  @spec reverse(list) :: list
  def reverse(l) do
    do_reverve(l, [])
  end

  defp do_reverve([head|tail], acc) do
    do_reverve(tail, [head | acc])
  end

  defp do_reverve([], acc), do: acc

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    reverse(do_map(l, [], f))
  end

  defp do_map([head|tail], acc, f) do
    do_map(tail, [f.(head) | acc], f)
  end

  defp do_map([], acc, _), do: acc

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    reverse(do_filter(l, [], f))
  end

  defp do_filter([head|tail], acc, f) do
    if f.(head) do
      acc = [head | acc]
    end
    do_filter(tail, acc, f)
  end

  defp do_filter([], acc, _), do: acc

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
    do_reduce(l, acc, f)
  end

  defp do_reduce([head|tail], acc, f) do
    do_reduce(tail, f.(head, acc), f)
  end

  defp do_reduce([], acc, _), do: acc

  @spec append(list, list) :: list
  def append(a, b) do
    reverse(do_append(a, b, []))
  end

  defp do_append([head|tail], b, acc) do
    do_append(tail, b, [head|acc])
  end

  defp do_append([], [head|tail], acc) do
    do_append([], tail, [head|acc])
  end

  defp do_append([], [], acc), do: acc

  @spec concat([[any]]) :: [any]
  def concat(ll) do
    reverse(do_concat(ll, []))
  end

  defp do_concat([head|tail], acc) when is_list(head) do
    do_concat(tail, do_concat(head, acc))
  end

  defp do_concat([head|tail], acc) do
    do_concat(tail, [head|acc])
  end

  defp do_concat([], acc), do: acc

end
