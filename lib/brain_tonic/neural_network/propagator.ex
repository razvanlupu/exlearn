defmodule BrainTonic.NeuralNetwork.Propagator do
  @moduledoc """
  Propagates input trough a network
  """

  alias BrainTonic.Matrix

  @doc """
  Propagates input forward trough a network and return the result
  """
  @spec feed_forward([number], [[[number]]]) :: [number]
  def feed_forward(input, network) do
    %{
      activations: activations,
      biases:      biases,
      weights:     weights
    } = network

    full_network = [[input]|weights]

    feed_forward(full_network, biases, activations)
  end

  @spec feed_forward([[[number]]], [[number]], [function]) :: [number]
  defp feed_forward([network|[]], _, _) do
    [result] = network
    result
  end

  defp feed_forward([a, b | network], [c | biases], [d | activations]) do
    result = Matrix.multiply(a, b)
      |> Matrix.add(c)
      |> Matrix.apply(d)
    feed_forward([result|network], biases, activations)
  end
end