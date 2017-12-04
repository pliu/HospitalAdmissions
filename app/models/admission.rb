class Admission < ApplicationRecord
  validates :patient, presence: true
  validates :division, presence: true
  validates :room_num, presence: true
  validates :bed_num, presence: true

  belongs_to :patient
  belongs_to :division

  trigger.after(:insert) do
    '
    DECLARE x INT;
    DECLARE y INT;
    SET x = (SELECT COUNT(*) FROM admissions WHERE division_id = NEW.division_id);
    SET y = (SELECT total_beds FROM divisions WHERE id = NEW.division_id);
    IF x = y THEN
      UPDATE divisions
      SET status = 0
      WHERE id = NEW.division_id;
    END IF;'
  end

  trigger.after(:delete) do
    '
    UPDATE divisions
    SET status = 1
    WHERE id = OLD.division_id;'
  end
end
