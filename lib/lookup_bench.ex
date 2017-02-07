defmodule LookupBench do
  import Logger, only: [debug: 1]
  def perform do
    2..6 |> Enum.each(fn e ->
      record_count = :math.pow(10, e) |> round
      perform_with(record_count)
    end)
  end

  defp perform_with(record_count) do
    debug "starting benchmark"
    debug "loading data"
    city_map = File.stream!("./worldcitiespop.txt")
               |> Enum.take(record_count)
               |> Enum.reduce(%{}, fn line, acc ->
                 {key, val} = parse(line)
                 Map.put(acc, key, val)
               end)

    table_name = :"cities_#{record_count}"
    ^table_name = :ets.new(table_name, [:named_table, :protected])
    city_map
    |> Enum.each(fn {k, v} -> :ets.insert(table_name, {k, v}) end)

    2..4
    |> Enum.each(fn lookup_count_pow ->
      lookup_count = :math.pow(10, lookup_count_pow) |> round
      keys = Map.keys(city_map) |> Enum.shuffle |> Enum.take(lookup_count)

      Benchee.run(%{
                    "ets_#{record_count}_#{lookup_count}" => fn -> Enum.each(keys, fn key -> _ = :ets.lookup(table_name, key) end) end,
                    "map_#{record_count}_#{lookup_count}" => fn -> Enum.each(keys, fn key -> _ = city_map[key] end) end,
                  })
    end)

  end

  defp parse(line) do
    index = line
            |> to_charlist
            |> Enum.with_index
            |> Enum.filter_map(fn {char, _} -> char == ?, end, fn {_, index} -> index end)
            |> Enum.at(1)
    String.split_at(line |> String.trim, index)
  end
end
