User.find_by(name: 'Charlie')
Task.where(user_id: 3 )
Task.create(name:"Race", user_id: User.find(3))
Task.find_by(name:"Race").update(name:"Giraffe")

mytasks = Task.where(user_id:1)
mytasks.destroy_all

User.find(3).location

Task.where(user_id: User.find_by(name:'Bob').id)
User.find_by(name: 'Bob').tasks

spain = User.where(location:'Spain')
spain.each {|user| user.tasks.destroy_all}

Task.where(user_id: User.where(location: 'Spain')).destroy_all
