defmodule TimeTraveller do
  @moduledoc """
  Easily convert back and forth between local time and UTC
  """

  @doc """
  Hello world.

  ## Examples

      iex> TimeTraveller.hello
      :world

  """
  def beginning_of_day_utc(date, timezone) when is_binary(date) do
    midnight_local = Timex.parse!(date, "{YYYY}-{0M}-{0D}")
    to_utc(timezone, midnight_local)
  end

  def beginning_of_day_utc(%Date{} = date, timezone) when is_binary(timezone) do
    date
    |> Timex.to_datetime(timezone)
    |> Timex.to_datetime("UTC")
  end

  def beginning_of_day_utc(%NaiveDateTime{} = datetime, timezone) do
    datetime
    |> Timex.to_datetime(timezone)
    |> Timex.beginning_of_day()
    |> Timex.to_datetime("UTC")
  end

  def beginning_of_day_utc(%DateTime{} = datetime) do
    datetime
    |> Timex.beginning_of_day()
    |> Timex.to_datetime("UTC")
  end

  def beginning_of_week_local_in_utc(date, store) when is_binary(date) do
    beginning_of_week_local =
      Timex.parse!(date, "{YYYY}-{0M}-{0D}")
      |> Timex.beginning_of_week(:sun)

    to_utc(store.locale_timezone, beginning_of_week_local)
  end

  def beginning_of_month_local_in_utc(date, store) when is_binary(date) do
    beginning_of_month_local =
      Timex.parse!(date, "{YYYY}-{0M}-{0D}")
      |> Timex.beginning_of_month()

    to_utc(store.locale_timezone, beginning_of_month_local)
  end

  def beginning_of_year_local_in_utc(date, store) when is_binary(date) do
    beginning_of_year_local =
      Timex.parse!(date, "{YYYY}-{0M}-{0D}")
      |> Timex.beginning_of_year()

    to_utc(store.locale_timezone, beginning_of_year_local)
  end

  def to_utc(timezone, %NaiveDateTime{} = naive_datetime) do
    naive_datetime
    |> Timex.to_datetime(timezone)
    |> Timex.to_datetime("UTC")
  end

  def to_local(datetime, timezone) do
    datetime
    |> Timex.to_erl()
    |> Timex.to_datetime(timezone)
  end
end
