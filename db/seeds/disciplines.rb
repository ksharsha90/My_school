if Discipline.count.zero?
	puts 'Seeding Disciplines'

	%w('Disciplines').each do |name|
		Discipline.create!(name: name)
	end
end