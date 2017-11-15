require 'pry'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/expense'
require './lib/department'
require './lib/budget_category'
require './lib/municipal_budget'

class MunicipalBudgetTest < Minitest::Test
  def test_it_exists
    municipal_budget = MunicipalBudget.new

    assert_instance_of MunicipalBudget, municipal_budget
  end

  def test_has_expenses
    d = Department.new("Parks and Recreation")
    bc = BudgetCategory.new("Appliances")
    expense = Expense.new(d, bc, "656.50")
    expense_1 = Expense.new(d, bc, "656.50")
    municipal_budget = MunicipalBudget.new
    municipal_budget.add_expense(expense_1)

    assert_equal 1, municipal_budget.expenses.count
  end

  def test_can_add_another_expenses
    d = Department.new("Parks and Recreation")
    bc = BudgetCategory.new("Appliances")
    expense = Expense.new(d, bc, "656.50")
    expense_1 = Expense.new(d, bc, "656.50")
    expense_2 = Expense.new(d, bc, "656.50")
    municipal_budget = MunicipalBudget.new
    municipal_budget.add_expense(expense_1)
    municipal_budget.add_expense(expense_2)

    assert_equal 2, municipal_budget.expenses.count
  end

  def test_has_departments
    d = Department.new("Parks and Recreation")
    bc = BudgetCategory.new("Appliances")
    expense = Expense.new(d, bc, "656.50")
    expense_1 = Expense.new(d, bc, "656.50")
    expense_2 = Expense.new(d, bc, "656.50")
    municipal_budget = MunicipalBudget.new
    municipal_budget.add_expense(expense_1)
    municipal_budget.add_expense(expense_2)

    assert_equal [d, d], municipal_budget.departments
  end

  def test_has_budget_categories
    d = Department.new("Parks and Recreation")
    bc = BudgetCategory.new("Appliances")
    expense = Expense.new(d, bc, "656.50")
    expense_1 = Expense.new(d, bc, "656.50")
    expense_2 = Expense.new(d, bc, "656.50")
    municipal_budget = MunicipalBudget.new
    municipal_budget.add_expense(expense_1)
    municipal_budget.add_expense(expense_2)

    assert_equal [bc, bc], municipal_budget.budget_categories
  end

  def test_has_total_expenses
    d = Department.new("Parks and Recreation")
    bc_1 = BudgetCategory.new("Printing")
    expense_1 = Expense.new(d, bc_1, "656.50")
    bc_2 = BudgetCategory.new("Appliances")
    expense_2 = Expense.new(d, bc_2, "20.45")
    municipal_budget = MunicipalBudget.new
    municipal_budget.add_expense(expense_1)
    municipal_budget.add_expense(expense_2)

    assert_equal 676.95, municipal_budget.total_expenses
  end

  def test_has_alphabetical_budget_category
    d = Department.new("Parks and Recreation")
    bc_1 = BudgetCategory.new("Printing")
    expense_1 = Expense.new(d, bc_1, "656.50")
    bc_2 = BudgetCategory.new("Appliances")
    expense_2 = Expense.new(d, bc_2, "20.45")
    municipal_budget = MunicipalBudget.new
    municipal_budget.add_expense(expense_1)
    municipal_budget.add_expense(expense_2)
    assert_equal 676.95, municipal_budget.total_expenses

    assert_equal ["Appliances", "Printing"], municipal_budget.alphabtical_budget_category
  end
end
