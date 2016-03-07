# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require 'pry'

# More methods will go below

def experienced
	@candidates.select! do |candidate|
		@newarray = candidate[:years_of_experience] > 2
		end
end

def find(id)
	raise '@candidates must be an Array' if @candidates.nil?
	@candidates.select do |candidate|
		candidate[:id] == id
	end
end

def git_master
	@candidates.select! do |candidate|
		candidate[:github_points] > 100
	end
end

def at_least_python
	@candidates.select! do |candidate|
		candidate[:languages].include?("Python" && "Ruby")
	end
end

def old_enough(age)
	@candidates.select do |candidate|
		candidate[:age] > age
	end
end

def applied_with_days(number_of_days)
	@candidates.select do |candidate|
		candidate[:date_applied] > number_of_days.days.ago.to_date
	end
end
	
def qualified_candidates
	experienced && git_master && at_least_python && applied_with_days(15) && old_enough(18)
end

def by_years_and_github
	@candidates.sort_by{|candidate| [candidate[:years_of_experience], candidate[:github_points]]}
end