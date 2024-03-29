module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action -> { authorize! User, with: SessionPolicy }
    skip_verify_authorized only: %i[new create]
  end
end
