defmodule Graphics.SVG do
  defstruct width: 100, height: 100, contents: []

  def new(contents, width, height) when is_binary(contents) do
    new([contents], width, height)
  end

  def new(contents, width, height) do
    %__MODULE__{width: width, height: height, contents: contents}
  end

  def add(%{contents: contents} = svg, element) do
    %Graphics.SVG{svg | contents: [element | contents]}
  end

  def render(svg = %Graphics.SVG{}) do
    """
    <svg width="#{svg.width}" height="#{svg.height}" xmlns="http://www.w3.org/2000/svg">
      #{Enum.join(svg.contents, "\n")}
    </svg>
    """
    |> Kino.Image.new(:svg)
  end
end
