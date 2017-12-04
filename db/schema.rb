# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20171204192846) do

  create_table "admission_requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "patient_id",                null: false
    t.integer  "division_id",               null: false
    t.text     "rational",    limit: 65535
    t.integer  "priority"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["division_id"], name: "index_admission_requests_on_division_id", using: :btree
    t.index ["patient_id"], name: "index_admission_requests_on_patient_id", using: :btree
  end

  create_table "admissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "patient_id",       null: false
    t.integer  "division_id",      null: false
    t.integer  "room_num",         null: false
    t.integer  "bed_num",          null: false
    t.string   "insurance_string"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["division_id"], name: "index_admissions_on_division_id", using: :btree
    t.index ["patient_id"], name: "index_admissions_on_patient_id", unique: true, using: :btree
  end

  create_table "divisions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "charge_nurse_id", null: false
    t.string   "division_name",   null: false
    t.string   "location",        null: false
    t.integer  "total_beds",      null: false
    t.string   "extension",       null: false
    t.integer  "status",          null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["charge_nurse_id"], name: "index_divisions_on_charge_nurse_id", using: :btree
  end

  create_table "drugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "insurance_string",               null: false
    t.string   "first_name",                     null: false
    t.string   "last_name",                      null: false
    t.string   "address",                        null: false
    t.string   "phone_number",                   null: false
    t.datetime "dob",                            null: false
    t.integer  "gender",                         null: false
    t.integer  "marital_status",                 null: false
    t.text     "nok",              limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["insurance_string"], name: "index_patients_on_insurance_string", unique: true, using: :btree
  end

  create_table "prescriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "patient_id",    null: false
    t.integer  "drug_id",       null: false
    t.integer  "daily_units",   null: false
    t.integer  "admin_per_day", null: false
    t.string   "admin_method",  null: false
    t.datetime "start",         null: false
    t.datetime "end"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["drug_id"], name: "index_prescriptions_on_drug_id", using: :btree
    t.index ["patient_id"], name: "index_prescriptions_on_patient_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

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
