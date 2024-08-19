defmodule LagoApiClient.EventEstimateFeesInputEvent do
  @moduledoc """
  Provides struct and type for a EventEstimateFeesInputEvent
  """
  use LagoApiClient.Encoder

  @type t :: %__MODULE__{
          __info__: map,
          code: String.t(),
          external_subscription_id: String.t(),
          properties: map | nil
        }

  defstruct [:__info__, :code, :external_subscription_id, :properties]

  @doc false
  @spec __fields__(atom) :: keyword
  def __fields__(type \\ :t)

  def __fields__(:t) do
    [code: {:string, :generic}, external_subscription_id: {:string, :generic}, properties: :map]
  end
end
