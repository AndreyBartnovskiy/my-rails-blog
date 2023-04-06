module Users
  class PasswordsController < Devise::PasswordsController
    skip_verify_authorized
  end
end
