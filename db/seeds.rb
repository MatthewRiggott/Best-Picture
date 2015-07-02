FIRST_NAMES = ["Joe", "Sara", "Bob", "Chris", "Oscar", "Sue"]
LAST_NAMES =  ["1", "2", "3", "4", "5"]

FIRST_NAMES.each do |first|
  LAST_NAMES.each do |last|
    u = User.new(
      email: "#{first+last}@seed.com",
      name: first + " " + last,
    )
    u.password = "password"
    u.save


  create_table "photos", force: :cascade do |t|
    t.string  "url",                    null: false
    t.integer "vote_count", default: 0
    t.integer "contest_id"
    t.integer "user_id",                null: false
  end
