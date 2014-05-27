module ChallengesHelper
  def sortable(column , title = nil)
    title||=column.titleize
    css_class = column == params[:sort] ? 'current-sorted' : 'sort-link'
    if column == params[:sort]
      if params[:direction] != 'asc'
        css_dir = '<span class="glyphicon glyphicon-chevron-up" style="color: gold;"></span>'
      elsif
        css_dir = '<span class="glyphicon glyphicon-chevron-down" style="color: gold;"></span>'
      end
    end
    css_dir ||=''
    direction = column == params[:sort] && params[:direction] == 'asc' ? 'desc' :'asc'
    link_to raw(title+css_dir) , {:sort => column , :direction => direction} , {:class => css_class , :remote => true}
  end

  def last_workout_describe(workout)

    if(I18n.locale == :en)
      dis='Burn '+workout.total_cal.to_s+'cal in '+Time.at(workout.total_min).utc.strftime("%M:%S")+' with plan '+workout.workout_plan.name+'!'
    else
      dis=workout.total_cal.to_s+' کالری را در '+ Time.at(workout.total_min).utc.strftime("%M:%S")+' با برنامه ی '+workout.workout_plan.name+' سوزانده است!'
    end
    return dis
  end
end
