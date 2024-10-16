# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each do |candidate|
    if candidate[:id] == id
      return candidate
    end
  end  
end
  
def experienced?(threshold, candidate)
  candidate[:years_of_experience] > threshold
end
  
def qualified_candidates(candidates)
  qualified_candidates_list = []
  candidates.each do |candidate|
    if  (experienced?(2, candidate) &&
        github_points_threshold(100, candidate) &&
        (languages_known_requirement(['Ruby'], candidate) ||
        languages_known_requirement(['Python'], candidate)) &&
        recent_application(15, candidate) &&
        old_enough(17, candidate))
          qualified_candidates_list.push(candidate)
    end
  end
  return qualified_candidates_list
end
# More methods will go below
def github_points_threshold(threshold, candidate)
  candidate[:github_points] >= threshold 
end

def languages_known_requirement(requirement_array, candidate)
  requirement_array.each do |requirement|
    return false unless candidate[:languages].include?(requirement)
  end
  true 
end

def recent_application(date_applied_threshold, candidate)
  days_since_applied = (Date.today - candidate[:date_applied]).to_i
  days_since_applied <= date_applied_threshold
end

def old_enough(target_age, candidate)
  candidate[:age] > target_age
end

def sort_by_experience_descending(candidates)
  n = candidates.length
  loop do
    swapped = false
    (n - 1).times do |i|
      # Compare by years_of_experience first
      if candidates[i][:years_of_experience] < candidates[i + 1][:years_of_experience]
        candidates[i], candidates[i + 1] = candidates[i + 1], candidates[i] # Swap
        swapped = true
      # If years_of_experience are equal, compare by github_points
      elsif candidates[i][:years_of_experience] == candidates[i + 1][:years_of_experience] &&
            candidates[i][:github_points] < candidates[i + 1][:github_points]
        candidates[i], candidates[i + 1] = candidates[i + 1], candidates[i] # Swap
        swapped = true
      end
    end
    break unless swapped
  end
  candidates
end
