defmodule MatrixTest do
  use ExUnit.Case, async: true

  alias ExLearn.Matrix

  test "#add adds two matrices" do
    first  = [[1, 2, 3], [4, 5, 6]]
    second = [[5, 2, 1], [3, 4, 6]]

    expected = [[6, 4, 4], [7, 9, 12]]

    result = Matrix.add(first, second)

    assert result == expected
  end

  test "#apply applies a function on each element of the matrix" do
    function = &(&1 + 1)
    input    = [[1, 2, 3], [4, 5, 6]]
    expected = [[2, 3, 4], [5, 6, 7]]

    result = Matrix.apply(input, function)

    assert result == expected
  end

  test "#build creates a new matrix" do
    rows     = 2
    columns  = 3
    function = fn -> 1 end
    expected = [[1, 1, 1], [1, 1, 1]]

    result = Matrix.build(rows, columns, function)

    assert result == expected
  end

  test "#dot multiplies two matrices" do
    first  = [[1, 2, 3], [4, 5, 6]]
    second = [[1, 2], [3, 4], [5, 6]]

    expected = [[22, 28], [49, 64]]

    result = Matrix.dot(first, second)

    assert result == expected
  end

  test "#multiply performs elementwise multiplication of two matrices" do
    first  = [[1, 2, 3], [4, 5, 6]]
    second = [[5, 2, 1], [3, 4, 6]]

    expected = [[5, 4, 3], [12, 20, 36]]

    result = Matrix.multiply(first, second)

    assert result == expected
  end

  test "#multiply_with_scalar multiplies matrix element by a scalar" do
    matrix   = [[1, 2, 3], [4, 5, 6]]
    scalar   = 2
    expected = [[2, 4, 6], [8, 10, 12]]

    result = Matrix.multiply_with_scalar(matrix, scalar)

    assert result == expected
  end

  test "#substract substracts two matrices" do
    first  = [[1, 2, 3], [4, 5, 6]]
    second = [[5, 2, 1], [3, 4, 6]]

    expected = [[-4, 0, 2], [1, 1, 0]]

    result = Matrix.substract(first, second)

    assert result == expected
  end

  test "#substract_inverse substracts the second matrix from the first" do
    first  = [[1, 2, 3], [4, 5, 6]]
    second = [[5, 2, 1], [3, 4, 6]]

    expected = [[4, 0, -2], [-1, -1, 0]]

    result = Matrix.substract_inverse(first, second)

    assert result == expected
  end


  test "#transpose transposes a matrix" do
    input    = [[1, 2, 3], [4, 5, 6]]
    expected = [[1, 4], [2, 5], [3, 6]]

    result = Matrix.transpose(input)

    assert result == expected
  end
end
