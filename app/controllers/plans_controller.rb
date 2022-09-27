class PlansController < ApplicationController
  grant(
    member: %i[index show],
    manager: %i[index show],
    admin: :all
  )

  def index
    @plans = Plan.all
  end
end
