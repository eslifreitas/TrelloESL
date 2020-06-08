namespace :utils do
  desc "FILL DATABASE"

  task seed: :environment do
     
    puts "CREATING PERSONS"
    10.times do |i|
        Person.create!(
            name: Faker::Name.name,
            email: Faker::Internet.email,
            role: Faker::Lorem.word
            )            
    end
    puts "PERSONS [DONE]"
    
    puts "CREATING PROJECTS"
    Person.all.each do |person|
        Project.create!(
            name: Faker::Company.name,
            manager_id: person.id
        )            
    end
    puts "PROJECTS [DONE]"

    puts "CREATING HISTORIES"
    Project.all.each do |project|
      3.times do |i|
        History.create!(
          name: Faker::Lorem.word,
          requester_id: Person.all.sample.id,
          status: "Pending",
          owner_id: Person.all.sample.id,
          project_id: project.id,
          description: Faker::Lorem.sentence,
          started_at: Faker::Date.between(from: 60.days.ago, to: Date.today-5),
          finished_at: Faker::Date.between(from: 5.days.ago, to: Date.today),
          deadline: Faker::Date.forward(days: Random.rand(10)),
          points: 1
        )
      end
    end
    puts "HISTORIES [DONE]"

    puts "CREATING TASKS"
    10.times do |i|
      History.all.each do |history|
        Task.create!(
          description: Faker::Lorem.sentence,
          history_id: History.all.sample.id,
          done: false
        )
      end
    end
    puts "TAKS [DONE]"
    end

end
