# This is the main entrypoint into the program
# It requires the other files/gems that it needs
require 'pp'
require './candidates'
require './filters'

## Your test code can go here

# pp @candidates

# puts experienced?(@candidates.first)

# pp find(5)

# pp github_points_threshold(100, @candidates[4]) # 293 = true
# pp github_points_threshold(100, @candidates.first) # 32 = false

# The below should be true and is
# pp languages_known_requirement(['Ruby', 'Python'], @candidates.first)
# The below should be false and is
# pp languages_known_requirement(['Ruby', 'Python'], @candidates[2])

# pp recent_application(5, @candidates.first)

# pp old_enough(30, @candidates.first)

# pp qualified_candidates(@candidates)

pp sort_by_experience_descending(@candidates)