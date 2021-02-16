COLORS = ["green", "yellow", "orange", "red", "purple", "blue"]
USERS = [
  {
    username: "carlos",
    email: "carlostuna015@mail.com",
    first_name: "User",
    last_name: "Test",
    password: "123456"
  }, 
  { 
    username: "visitante",
    email: "visitante@mail.com",
    first_name: "User2",
    last_name: "Test2",
    password: "123456"
  }
]


USERS.each do |user_data|

  user = User.create(user_data)

  user.boards.create(name: "Organizable", closed: false, color: "lime", starred: true)
  user.boards.create(name: "Codeable", closed: false, color: "red", starred: true)
  user.boards.create(name: "Portafolio", closed: false, color: "blue", starred: true)
  user.boards.create(name: "DOTA", closed: false, color: "orange", starred: false)
  user.boards.create(name: "Consulting", closed: false, color: "purple", starred: false)
  user.boards.create(name: "LinkedIn", closed: false, color: "pink", starred: false)
  user.boards.create(name: "Meet Ups", closed: false, color: "green", starred: false)
  user.boards.create(name: "Side Project", closed: false, color: "grey", starred: false)
  user.boards.create(name: "Others", closed: false, color: "sky", starred: false)

  user.boards.create(name: "Codeable Postulation", closed: true, color: "blue", starred: false)
  user.boards.create(name: "Odin Project", closed: true, color: "red", starred: false)

  user.boards.each do |board|
    COLORS.each {|color| board.labels.create(name:"", color: color) }

    red_label = board.labels.find_by(color: "red")
    red_label.name = "Urgent"
    blue_label = board.labels.find_by(color: "blue")
    blue_label.name = "Important"

    todo = board.lists.create(name: "To Do", closed: false)
    todo.cards.create(name: "Add Animations", desc: nil, closed: false)
    todo.cards.create(name: "Refactor functions", desc: nil, closed: false)
    a11y = todo.cards.create(name: "Improve a11y", desc: nil, closed: false)
    a11y.labels << blue_label

    doing = board.lists.create(name: "Doing", closed: false)
    login_logout = doing.cards.create(name: "Login & Logout", desc: nil, closed: false)
    login = login_logout.checklists.create(name: "Login")
    login_logout.labels << red_label
    login_logout.labels << blue_label
    login.check_items.create(name: "Analize api", completed: true)
    login.check_items.create(name: "Create HTML and CSS", completed: true)
    login.check_items.create(name: "Make fetch request", completed: false)

    logout = login_logout.checklists.create(name: "Logout")
    logout.check_items.create(name: "Analize api", completed: true)
    logout.check_items.create(name: "Create button", completed: true)
    logout.check_items.create(name: "Make fetch request", completed: false)

    doing.cards.create(name: "Board Component", desc: nil, closed: false)
    doing.cards.create(name: "List Component", desc: nil, closed: false)
    doing.cards.create(name: "Card Component", desc: nil, closed: false)
    doing.cards.create(name: "Checklist Component", desc: nil, closed: false)


    done = board.lists.create(name: "Done", closed: false)
    meeting = done.cards.create(name: "Team meeting", desc: "Talk with the team about the project", closed: false)
    meeting.labels << blue_label

  end
end