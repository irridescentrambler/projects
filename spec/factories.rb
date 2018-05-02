FactoryBot.define do
  factory :developer, class: User do
    email "bhavesh.chauhan@gmail.com"
    password  "abcdefgh"
    role "developer"
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email "mohadikarnikhil09@gmail.com"
    password  "abcdefgh"
    role "admin"
  end

  factory :project, class: Project do
    name "Demo Project"
    description  "Abcd"
  end

  factory :task, class: Task do
    name "Demo Task"
    description  "Demo description"
  end
end