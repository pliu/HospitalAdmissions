# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggersAdmissionsInsertOrAdmissionsDelete < ActiveRecord::Migration
  def up
    create_trigger("admissions_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("admissions").
        after(:insert) do
      <<-SQL_ACTIONS

    DECLARE x INT;
    DECLARE y INT;
    SET x = (SELECT COUNT(*) FROM admissions WHERE division_id = NEW.division_id);
    SET y = (SELECT total_beds FROM divisions WHERE id = NEW.division_id);
    IF x = y THEN
      UPDATE divisions
      SET status = 0
      WHERE id = NEW.division_id;
    END IF;
      SQL_ACTIONS
    end

    create_trigger("admissions_after_delete_row_tr", :generated => true, :compatibility => 1).
        on("admissions").
        after(:delete) do
      <<-SQL_ACTIONS

    UPDATE divisions
    SET status = 1
    WHERE id = OLD.division_id;
      SQL_ACTIONS
    end
  end

  def down
    drop_trigger("admissions_after_insert_row_tr", "admissions", :generated => true)

    drop_trigger("admissions_after_delete_row_tr", "admissions", :generated => true)
  end
end
