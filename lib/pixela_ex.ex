defmodule PixelaEx do
  @moduledoc """
  API Client for Pixela.
  """

  alias PixelaEx.Client.UserFunctions
  alias PixelaEx.Client.GraphFunctions
  alias PixelaEx.Client.PixelFunctions
  alias PixelaEx.Client.WebhookFunctions

  @typedoc "User name for Pixela"
  @type username :: String.t

  @typedoc "A token string used to authenticate as a user to be created"
  @type token :: String.t

  @typedoc "Whether you agree to the terms of service"
  @type agree_terms_of_service :: boolean()

  @typedoc "Whether you are not a minor or if you are a minor and you have the parental consent of using Pixela"
  @type not_minor :: boolean()

  @typedoc "A new authentication token"
  @type new_token :: String.t

  @typedoc "An ID for identifying the pixelation graph"
  @type graph_id :: String.t

  @typedoc "the name of the pixelation graph"
  @type name :: String.t

  @typedoc "A unit of the quantity recorded in the pixelation graph. Ex. commit, kilogram, calory."
  @type unit :: String.t

  @typedoc "The type of quantity to be handled in the graph. Only `int` or `float` are supported."
  @type quantity_type :: String.t

  @typedoc "The behavior when the Webhook is invoked. Only `increment` or `decrement` are supported."
  @type countup_type :: String.t

  @typedoc "The display color of the pixel in the pixelation graph. `shibafu`, `momiji`, `sora`, `ichou`, `ajisai` and `kuro` are supported as color kind."
  @type color :: String.t

  @typedoc "The date on which the quantity is to be recorded. It is specified in yyyyMMdd format."
  @type date :: String.t

  @typedoc "The graph display mode. As of October 23, 2018, support only short mode for displaying only about 90 days."
  @type mode :: String.t

  @typedoc "The quantity to be registered on the specified date."
  @type quantity :: String.t

  @typedoc "The hash string specifying the webhook"
  @type webhook_hash :: String.t

  @typedoc "HTTP response from HTTPotion"
  @type http_result :: HTTPotion.Response.t | %HTTPotion.AsyncResponse{} | %HTTPotion.ErrorResponse{}

  #
  # User Functions
  #
  defdelegate create_user(param), to: UserFunctions
  defdelegate update_user(username, token, param), to: UserFunctions
  defdelegate delete_user(username, token), to: UserFunctions

  # Graph Functions
  #
  defdelegate create_graph(username, token, param), to: GraphFunctions
  defdelegate get_graphs(username, token), to: GraphFunctions
  defdelegate graph_url(username, graph_id, param \\ %{}), to: GraphFunctions
  defdelegate update_graph(username, token, graph_id, param), to: GraphFunctions
  defdelegate delete_graph(username, token, graph_id), to: GraphFunctions

  #
  # Pixel Functions
  #
  defdelegate create_pixel(username, token, graph_id, param), to: PixelFunctions
  defdelegate get_pixel(username, token, graph_id, date), to: PixelFunctions
  defdelegate update_pixel(username, token, graph_id, date, param), to: PixelFunctions
  defdelegate increment_pixel(username, token, graph_id), to: PixelFunctions
  defdelegate decrement_pixel(username, token, graph_id), to: PixelFunctions
  defdelegate delete_pixel(username, token, graph_id, date), to: PixelFunctions

  #
  # Webhook Functions
  #
  defdelegate create_webhook(username, token, param), to: WebhookFunctions
  defdelegate get_webhooks(username, token), to: WebhookFunctions
  defdelegate invoke_webhook(username, webhook_hash), to: WebhookFunctions
  defdelegate delete_webhook(username, token, webhook_hash), to: WebhookFunctions
end
