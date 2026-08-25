require 'test_helper'

class OproClientAppTest < ActiveSupport::TestCase

  test "keeps client app uniqueness validation case sensitive" do
    app_id_validator = Opro::Oauth::ClientApp.validators_on(:app_id).find do |validator|
      validator.kind == :uniqueness
    end
    name_validator = Opro::Oauth::ClientApp.validators_on(:name).find do |validator|
      validator.kind == :uniqueness
    end

    assert_equal true, app_id_validator.options[:case_sensitive]
    assert_equal true, name_validator.options[:case_sensitive]
  end

  test "generate_unique_app_id" do
    client_app  = create_client_app
    app_id      = client_app.app_id
    new_app_id  = Opro::Oauth::ClientApp.generate_unique_app_id(app_id)
    assert_not_equal app_id, new_app_id
  end
end
