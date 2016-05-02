# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each do |index|
    if index[:id] == id
      return index
    end
  end
  nil
end

def experienced?(candidate)
  is_experianced=false
  if candidate[:years_of_experience] > 2
    is_experianced=true
  end
end

=begin
Are experienced
Have 100 or more Github points
Know at least Ruby or Python
Applied in the last 15 days
Are over the age of 17 (18+)
=end

def qualified_candidates(candidates)
  qualified=[]
  candidates.each do |index|
    exp=experienced?(index)
    points=index[:github_points]
    lang=index[:languages].include? ('Ruby' || 'Python')
    date= (Date.today - index[:date_applied]).to_i
    age = index[:age]
    if (exp && (points > 99) && (lang==true) && (age > 17) && date<15)
      qualified << index
    end
  end
  return qualified
end

def ordered_by_qualifications (candidates)
  candidate_arr = []
  candidates.each do |index|
    candidate_arr << index
  end

  ans = candidate_arr.sort! { |p1, p2| [p2[:years_of_experience], p2[:github_points]] <=> [p1[:years_of_experience], p1[:github_points]] }

  return ans
end

# More methods will go below
