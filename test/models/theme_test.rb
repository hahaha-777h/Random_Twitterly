require "test_helper"

class ThemeTest < ActiveSupport::TestCase
  fixtures :themes  # <= fixtures を読み込む
  def setup
    @theme = Theme.new(title: "好きなお菓子")
  end

  test "should be valid" do
    assert @theme.valid?
  end
  test "random theme is one of fixtures" do
    theme = Theme.order("RANDOM()").first
    assert_includes Theme.pluck(:title), theme.title
  end
end
