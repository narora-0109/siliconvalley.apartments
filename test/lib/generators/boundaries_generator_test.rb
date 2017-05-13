require 'test_helper'
require 'generators/boundaries/boundaries_generator'

class BoundariesGeneratorTest < Rails::Generators::TestCase
  tests BoundariesGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
