module ProjectsHelper

  def pledge_time_remaining(project)
    pledged_times = project.pledges.map{|pledge| pledge.hours.to_i}
    project.estimated_hours.to_i - pledged_times.sum
  end

  def total_pledge_time(project)
    project.pledges.map{|pledge| pledge.hours.to_i}.sum
  end


  def already_pledged?(project, user)
    pledge = Pledge.where(project_id: project.id, user_id: current_user.id)
    !pledge.empty?
  end

  def reformat_old_projects
    @projects = Project.where('date < ?', "#{Date.today}")
    @projects.each do |p|
      p.pledges.destroy_all
      p.save
    end
  end

end