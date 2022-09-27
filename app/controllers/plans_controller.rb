class PlansController < ApplicationController
  grant(
    member: %i[index show],
    manager: %i[index show],
    admin: :all
  )

  def index; end
end
