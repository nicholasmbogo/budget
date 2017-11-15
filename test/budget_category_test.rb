require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/department'
require './lib/budget_category'

class DeparmentTest < Minitest::Test
  def test_it_exists
    budget_category = BudgetCategory.new("Appliances")

    assert_instance_of BudgetCategory, budget_category
  end

  def test_it_has_a_name
    budget_category = BudgetCategory.new("Appliances")

    assert_equal "Appliances", budget_category.name
  end
end
