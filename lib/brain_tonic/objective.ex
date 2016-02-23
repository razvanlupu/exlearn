defmodule BrainTonic.Objective do
  @moduledoc """
  Translates objective names to functions
  """

  alias BrainTonic.Calculator

  @doc """
  Returns the appropriate function
  """
  @spec determine(map) :: (() -> float)
  def determine(setup) do
    case setup do
      %{function: function, derivative: derivative}
          when function |> is_function and derivative |> is_function ->
        %{function: function, derivative: derivative}
      :quadratic -> quadratic_pair
    end
  end

  defp quadratic_pair do
    function   = &quadratic_cost_function/2
    derivative = &quadratic_cost_partial_derivative/2
    %{function: function, derivative: derivative}
  end

  @spec quadratic_cost_function([], []) :: []
  defp quadratic_cost_function(expected, actual) do
    1 / 2 * Calculator.dot_square_diff(expected, actual)
  end

  @spec quadratic_cost_partial_derivative([], []) :: []
  defp quadratic_cost_partial_derivative(expected, actual) do
    Calculator.substract(actual, expected)
  end
end
