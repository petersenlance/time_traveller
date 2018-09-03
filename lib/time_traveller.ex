defmodule TimeTraveller do
  @moduledoc """
  Easily calculate the UTC representation of common local times. A light wrapper around
  Timex, TimeTraveller allows you to think in local time and get the UTC representation.
  """

  @doc """
  Returns the UTC representation of the beginning of the day for the given date
  and timezone. The date can be a string in the format "YYYY-MM-DD" or a Date, DateTime,
  or NaiveDateTime struct. The date is interpreted as being in the timezone specified
  and the UTC datetime is returned.

  ## Examples

      iex> TimeTraveller.beginning_of_day_utc("2018-09-01", "America/Denver")
      #DateTime<2018-09-01 06:00:00Z>

  """
  @spec beginning_of_day_utc(
          String.t() | Date.t() | NaiveDateTime.t() | DateTime.t(),
          Timex.Types.valid_timezone()
        ) :: DateTime.t()
  def beginning_of_day_utc(date, timezone) do
    _beginning_of_day_utc(date, timezone)
  end

  @spec _beginning_of_day_utc(String.t(), Timex.Types.valid_timezone()) :: DateTime.t()
  defp _beginning_of_day_utc(date, timezone) when is_binary(date) do
    date
    |> Timex.parse!("{YYYY}-{0M}-{0D}")
    |> naive_utc(timezone)
  end

  @spec _beginning_of_day_utc(Date.t(), Timex.Types.valid_timezone()) :: DateTime.t()
  defp _beginning_of_day_utc(%Date{} = date, timezone) when is_binary(timezone) do
    date
    |> Timex.to_datetime(timezone)
    |> Timex.to_datetime("UTC")
  end

  @spec _beginning_of_day_utc(NaiveDateTime.t(), Timex.Types.valid_timezone()) :: DateTime.t()
  defp _beginning_of_day_utc(%NaiveDateTime{} = datetime, timezone) do
    datetime
    |> Timex.to_datetime(timezone)
    |> Timex.beginning_of_day()
    |> Timex.to_datetime("UTC")
  end

  @spec _beginning_of_day_utc(DateTime.t(), Timex.Types.valid_timezone()) :: DateTime.t()
  defp _beginning_of_day_utc(%DateTime{} = datetime, timezone) do
    datetime
    |> Timex.to_datetime(timezone)
    |> Timex.beginning_of_day()
    |> Timex.to_datetime("UTC")
  end

  @doc """
  Returns the UTC representation of the beginning of the week for the given date
  and timezone. The date can be a string in the format "YYYY-MM-DD" or a Date, DateTime,
  or NaiveDateTime struct. The date is interpreted as being in the timezone specified
  and the UTC datetime is returned. Week starts on Sunday.

  ## Examples

      iex> TimeTraveller.beginning_of_week_utc("2018-09-01", "America/Denver")
      #DateTime<2018-08-26 06:00:00Z>

  """
  @spec beginning_of_week_utc(
          String.t() | Date.t() | NaiveDateTime.t() | DateTime.t(),
          Timex.Types.valid_timezone()
        ) :: DateTime.t()
  def beginning_of_week_utc(date, timezone) do
    _beginning_of_week_utc(date, timezone, :sun)
  end

  @doc """
  Returns the UTC representation of the beginning of the week for the given date
  and timezone. The date is interpreted as being in the timezone specified and
  the UTC datetime is returned.

  The weekstart can between 1..7, an atom e.g. :mon, or a string e.g. “Monday”

  ## Examples

      iex> TimeTraveller.beginning_of_week_utc("2018-09-01", "America/Denver")
      #DateTime<2018-08-26 06:00:00Z>

  """
  @spec beginning_of_week_utc(
          String.t() | Date.t() | NaiveDateTime.t() | DateTime.t(),
          Timex.Types.valid_timezone(),
          Timex.Types.weekstart()
        ) :: DateTime.t()
  def beginning_of_week_utc(date, timezone, weekstart) do
    _beginning_of_week_utc(date, timezone, weekstart)
  end

  @spec _beginning_of_week_utc(String.t(), Timex.Types.valid_timezone(), Timex.Types.weekstart()) ::
          DateTime.t()
  defp _beginning_of_week_utc(date, timezone, week_start) when is_binary(date) do
    date
    |> Timex.parse!("{YYYY}-{0M}-{0D}")
    |> Timex.beginning_of_week(week_start)
    |> naive_utc(timezone)
  end

  @spec _beginning_of_week_utc(Date.t(), Timex.Types.valid_timezone(), Timex.Types.weekstart()) ::
          DateTime.t()
  defp _beginning_of_week_utc(%Date{} = date, timezone, week_start)
       when is_binary(timezone) and is_atom(week_start) do
    date
    |> Timex.to_datetime(timezone)
    |> Timex.beginning_of_week(week_start)
    |> Timex.to_datetime("UTC")
  end

  @spec _beginning_of_week_utc(
          NaiveDateTime.t(),
          Timex.Types.valid_timezone(),
          Timex.Types.weekstart()
        ) :: DateTime.t()
  defp _beginning_of_week_utc(%NaiveDateTime{} = datetime, timezone, week_start) do
    datetime
    |> Timex.to_datetime(timezone)
    |> Timex.beginning_of_week(week_start)
    |> Timex.to_datetime("UTC")
  end

  @spec _beginning_of_week_utc(
          DateTime.t(),
          Timex.Types.valid_timezone(),
          Timex.Types.weekstart()
        ) :: DateTime.t()
  defp _beginning_of_week_utc(%DateTime{} = datetime, timezone, week_start) do
    datetime
    |> Timex.to_datetime(timezone)
    |> Timex.beginning_of_week(week_start)
    |> Timex.to_datetime("UTC")
  end

  @doc """
  Returns the UTC representation of the beginning of the month for the given date
  and timezone. The date can be a string in the format "YYYY-MM-DD" or a Date, DateTime,
  or NaiveDateTime struct. The date is interpreted as being in the timezone specified
  and the UTC datetime is returned.

  ## Examples

      iex> TimeTraveller.beginning_of_month_utc("2018-09-03", "America/Denver")
      #DateTime<2018-09-01 06:00:00Z>

  """
  @spec beginning_of_month_utc(
          String.t() | Date.t() | NaiveDateTime.t() | DateTime.t(),
          Timex.Types.valid_timezone()
        ) :: DateTime.t()
  def beginning_of_month_utc(date, timezone) do
    _beginning_of_month_utc(date, timezone)
  end

  @spec _beginning_of_month_utc(String.t(), Timex.Types.valid_timezone()) :: DateTime.t()
  defp _beginning_of_month_utc(date, timezone) when is_binary(date) do
    date
    |> Timex.parse!("{YYYY}-{0M}-{0D}")
    |> Timex.beginning_of_month()
    |> naive_utc(timezone)
  end

  @spec _beginning_of_month_utc(Date.t(), Timex.Types.valid_timezone()) :: DateTime.t()
  defp _beginning_of_month_utc(%Date{} = date, timezone) when is_binary(timezone) do
    date
    |> Timex.to_datetime(timezone)
    |> Timex.beginning_of_month()
    |> Timex.to_datetime("UTC")
  end

  @spec _beginning_of_month_utc(NaiveDateTime.t(), Timex.Types.valid_timezone()) :: DateTime.t()
  defp _beginning_of_month_utc(%NaiveDateTime{} = datetime, timezone) do
    datetime
    |> Timex.to_datetime(timezone)
    |> Timex.beginning_of_month()
    |> Timex.to_datetime("UTC")
  end

  @spec _beginning_of_month_utc(DateTime.t(), Timex.Types.valid_timezone()) :: DateTime.t()
  defp _beginning_of_month_utc(%DateTime{} = datetime, timezone) do
    datetime
    |> Timex.to_datetime(timezone)
    |> Timex.beginning_of_month()
    |> Timex.to_datetime("UTC")
  end

  @doc """
  Returns the UTC representation of the beginning of the year for the given date
  and timezone. The date can be a string in the format "YYYY-MM-DD" or a Date, DateTime,
  or NaiveDateTime struct. The date is interpreted as being in the timezone specified
  and the UTC datetime is returned.

  ## Examples

      iex> TimeTraveller.beginning_of_year_utc("2018-09-03", "America/Denver")
      #DateTime<2018-01-01 07:00:00Z>

  """
  @spec beginning_of_year_utc(
          String.t() | Date.t() | NaiveDateTime.t() | DateTime.t(),
          Timex.Types.valid_timezone()
        ) :: DateTime.t()
  def beginning_of_year_utc(date, timezone) do
    _beginning_of_year_utc(date, timezone)
  end

  @spec _beginning_of_year_utc(String.t(), Timex.Types.valid_timezone()) :: DateTime.t()
  defp _beginning_of_year_utc(date, timezone) when is_binary(date) do
    date
    |> Timex.parse!("{YYYY}-{0M}-{0D}")
    |> Timex.beginning_of_year()
    |> naive_utc(timezone)
  end

  @spec _beginning_of_year_utc(Date.t(), Timex.Types.valid_timezone()) :: DateTime.t()
  defp _beginning_of_year_utc(%Date{} = date, timezone) when is_binary(timezone) do
    date
    |> Timex.to_datetime(timezone)
    |> Timex.beginning_of_year()
    |> Timex.to_datetime("UTC")
  end

  @spec _beginning_of_year_utc(NaiveDateTime.t(), Timex.Types.valid_timezone()) :: DateTime.t()
  defp _beginning_of_year_utc(%NaiveDateTime{} = datetime, timezone) do
    datetime
    |> Timex.to_datetime(timezone)
    |> Timex.beginning_of_year()
    |> Timex.to_datetime("UTC")
  end

  @spec _beginning_of_year_utc(DateTime.t(), Timex.Types.valid_timezone()) :: DateTime.t()
  defp _beginning_of_year_utc(%DateTime{} = datetime, timezone) do
    datetime
    |> Timex.to_datetime(timezone)
    |> Timex.beginning_of_year()
    |> Timex.to_datetime("UTC")
  end

  @doc """
  Converts a NaiveDateTime to the specified timezone and then
  converts that to UTC.

  ## Examples

      iex> ndt = "2018-09-03" |> Timex.parse!("{YYYY}-{0M}-{0D}")
      iex> TimeTraveller.naive_utc(ndt, "America/Denver")
      #DateTime<2018-09-03 06:00:00Z>

  """
  @spec naive_utc(NaiveDateTime.t(), Timex.Types.valid_timezone()) :: DateTime.t()
  def naive_utc(%NaiveDateTime{} = naive_datetime, timezone) do
    naive_datetime
    |> Timex.to_datetime(timezone)
    |> Timex.to_datetime("UTC")
  end

  # def to_local(datetime, timezone) do
  #   datetime
  #   |> Timex.to_erl()
  #   |> Timex.to_datetime(timezone)
  # end
end
