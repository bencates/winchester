defmodule Winchester.CustomTypes.ProjectStatus do
  @behaviour Ecto.Type

  # We just dump the whole contents of the table into a literal...
  @statuses [
    {1, :bidding, "bidding"},
    {2, :proposal, "proposal to client"},
    {3, :in_progress, "in progress"},
    {4, :completed "completed"},
    {6, :canceled, "canceled"},
  ]

  # ...and precalculate any views into the table we might need.
  @codes            Enum.map(@statuses, &elem(&1, 1))
  @codes_as_strings Enum.into(@codes, &{to_string(&1), &1})
  @codes_by_id      Enum.into(@statuses, %{}, fn {k, v, _} -> {k, v} end)
  @ids_by_code      Enum.into(@statuses, %{}, fn {k, v, _} -> {v, k} end)
  @names_by_code    Enum.into(@statuses, %{}, fn {_, k, v} -> {k, v} end)
    
  # Our database IDs, and therefore foreign keys, are integers.
  def type, do: :integer

  # Cast is the only complicated part. We want to return an error for any
  # status code that isn't in the table, but we should accept either atoms or
  # strings so that params don't need special handling. We also accept
  # integers, just in case.
  def cast(code) when is_atom(code), do: Enum.fetch(@codes, code)
  def cast(id) when is_integer(id), do: Map.fetch(@codes_by_id, id)
  def cast(code) when is_binary(code), do: Map.fetch(@codes_as_strings, code)

  # Dumping to and reading from the DB is just a matter of grabbing the
  # equivalent value from the relevant map.
  def dump(code), do: Map.fetch(@ids_by_code, code)
  def load(id), do: Map.fetch(@codes_by_id, id)

  # Finally we provide a getter to lookup the human readable name.
  def name(code) do Map.get(@names_by_code, code)
end
