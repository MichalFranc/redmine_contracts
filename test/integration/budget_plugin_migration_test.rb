require 'test_helper'

class BudgetPluginMigrationTest < ActionController::IntegrationTest
  def setup
    configure_overhead_plugin
  end

  def load_test_fixture
    YAML.load(File.read(File.expand_path(File.dirname(__FILE__)) + "/../fixtures/budget_plugin_migration/budget.yml"))
  end

  context "migrate" do
    setup do
      @data = load_test_fixture
    end

    should "load a YAML dump of the old budget data" do
      RedmineContracts::BudgetPluginMigration.migrate(@data)

      assert_equal @data, RedmineContracts::BudgetPluginMigration.data
    end
    
    should "create a new Deliverable for each old Deliverable"
    
    should "create a new Contract for each project that had an old deliverable"
  end
end
