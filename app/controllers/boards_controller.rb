class BoardsControllers < ApplicationController
  grant(
    member: %i[index show],
    manager: :all,
    admin: :all
  )
end
