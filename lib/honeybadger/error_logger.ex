# This is inspired by the erlang client. If you want to improve upon this client, you might find some inspiration there: https://github.com/fyler/lager_honeybadger_backend/blob/master/src/lager_honeybadger_backend.erl

defmodule Honeybadger.ErrorLogger do
  @version "0.1"

  use GenEvent

  def init(_) do
    {:ok, self}
  end

  def handle_event({:error, _pid, event}, state) do
    { Logger, error_message, _date_and_time, _pid } = event

    error_message
    |> inspect  # it's sometimes a string, sometimes a few other things, at this point, we don't care
                # as long as it's reported
    |> report_error

    {:ok, state}
  end

  def handle_event({_other, _pid, _event}, state) do
    {:ok, state}
  end

  defp report_error(error_message) do
    error_message
    |> build_payload
    |> send_to_honeybadger(System.get_env("HONEYBADGER_API_KEY"))
  end

  defp build_payload(error_message) do
    %{
      notifier: %{
        name: "Elixir honeybadger client",
        url: "https://github.com/joakimk/honeybadger",
        version: @version
      },
      error: %{
        class: "Error",
        message: error_message
      },
      server: %{
        environment_name: Mix.env
      }
    }
  end

  defp send_to_honeybadger(_payload, nil) do
    # no-op when there is no api key (usually in dev)
  end

  defp send_to_honeybadger(payload, api_key) do
    response = HTTPotion.post("https://api.honeybadger.io/v1/notices",
      [
        body: Poison.encode!(payload),
        headers: [
          "Content-Type": "application/json; charset=utf-8",
          "X-API-Key": api_key,
          "Accept": "application/json"
        ]
      ]
    )

    if response.status_code != 201 do
      raise "Unknown response from honeybadger: #{inspect(response)}"
    end
  end
end
