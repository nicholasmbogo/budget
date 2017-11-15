class MunicipalBudget

  attr_reader :expenses,
              :departments,
              :budget_categories

  def initialize
    @expenses             = []
    @departments          = []
    @budget_categories    = []
  end

  def add_expense(expense)
    @expenses             << expense
    @departments          << expense.department
    @budget_categories    << expense.budget_category
  end

  def total_expenses
    expenses.reduce(0) do |sum, expense|
      sum += expense.amount
    end
  end

  def alphabtical_budget_category
    budget_categories.map do |budget_category|
      budget_category.name
    end.sort
  end
end
