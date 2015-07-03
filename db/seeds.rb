FIRST_NAMES = ["Joe", "Sara", "Bob", "Chris", "Oscar", "Sue"]
LAST_NAMES =  ["1", "2", "3", "4", "5"]
PHOTOS = [
  "http://www.hdimagewallpaper.com/wp-content/uploads/2015/01/Random-Cool-Images-10-HD-Screensavers.jpg",
  "http://cdn.phys.org/newman/gfx/news/hires/2013/takingtheran.jpg",
  "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQG1cDCM-yULMpqRIH8aWb99jVQXqehtvqzEAExZiBFuCSKy8S4Zg",
  "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRUVqKQZO10wSNEzCv90ZqDdWowlWjW7-fq_m6qDErvbD0-63eu",
  "http://images2.fanpop.com/image/photos/8600000/random-animals-animals-8676039-1600-1200.jpg"
]
GENDER = ["Male", "Female"]
FIRST_NAMES.each do |first|
  LAST_NAMES.each do |last|
    u = User.new(
      email: "#{first+last}@seed.com",
      name: first + " " + last,
      sex: GENDER.sample,
      encrypted_password: "password"
    )
    u.password = "password"
    u.password_confirmation = "password"
    u.save
    contest = Contest.create(
      user: u
    )
    PHOTOS.each do |pic|
      Photo.create(
        url: pic,
        user: u,
        contest: contest
      )
    end
  end
end
