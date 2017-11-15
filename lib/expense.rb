class Expense

  attr_reader :department,
              :budget_category,
              :amount

  def initialize(department, budget_category, amount)
    @department = department
    @budget_category = budget_category
    @amount = amount.to_f
  end
end
