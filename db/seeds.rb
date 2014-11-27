# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed the priority_levels table
Priority.delete_all
pl1 = Priority.create!(pri_name: 'No Priority')
pl2 = Priority.create!(pri_name: 'Breaking News')
pl3 = Priority.create!(pri_name: 'Happening')
pl4 = Priority.create!(pri_name: 'Developing')

# Seed the sections table
Section.delete_all
sec1 = Section.create!(sec_name: 'Business & Economics')
sec2 = Section.create!(sec_name: 'Government & Politics')
sec3 = Section.create!(sec_name: 'Sports')
sec4 = Section.create!(sec_name: 'Science')
sec5 = Section.create!(sec_name: 'Environment')
sec6 = Section.create!(sec_name: 'Arts & Entertainment')

# Seed the pipeline table
pip1 = Pipeline.create!(pip_name: 'New')
pip2 = Pipeline.create!(pip_name: 'In Development')
pip3 = Pipeline.create!(pip_name: 'Awaiting Approval')
pip4 = Pipeline.create!(pip_name: 'Completed')
pip5 = Pipeline.create!(pip_name: 'Active')
pip6 = Pipeline.create!(pip_name: 'Inactive')