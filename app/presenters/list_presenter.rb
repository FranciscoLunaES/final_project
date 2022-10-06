class ListPresenter
  def initialize(priority)
    @priority = priority
  end

  def priority_color
    priorities = { 'Low' => 'text-bg-primary', 'Medium' => 'text-bg-secondary', 'High' => 'text-bg-danger' }
    priorities[@priority]
  end
end
