if Teacher.count.zero?
	puts 'Seeding Teachers'
	Teacher.create!(first_name: "Harsha", last_name: "Sri", description: "Main Teacher")
	Teacher.create!(first_name: "pramod", last_name: "nimmagadda", description: "second Teacher")
	Teacher.create!(first_name: "kumar", last_name: "pavan", description: "Third Teacher")
end