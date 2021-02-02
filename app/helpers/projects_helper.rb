module ProjectsHelper

  def pledge_time_remaining(project)
    pledged_times = project.pledges.map{|pledge| pledge.hours.to_i}
    project.estimated_hours.to_i - pledged_times.sum
  end

end