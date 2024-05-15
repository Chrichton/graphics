defmodule Graphics.SVG.Rectangle do
  defstruct x: 0, y: 0, width: 10, height: 10, fill: :black

  def new(opts \\ []) do
    __struct__(opts)
  end

  def render(rect) do
    ~s("<rect x="#{rect.x}" y="#{rect.y}" width="#{rect.width}" height="#{rect.height}" fill="#{rect.fill}" />")
  end

  def draw(opts \\ []) do
    opts
    |> new()
    |> render()
  end
end
