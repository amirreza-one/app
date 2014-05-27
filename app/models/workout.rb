class Workout < ActiveRecord::Base
  belongs_to :user
  belongs_to :workout_plan

  def self.calculateCalory(level,heart,time,p)
    profile = Profile.find(p)
    now = Time.now.utc.to_date
    age = now.year - profile.birthdate.year - (profile.birthdate.to_date.change(:year => now.year) > now ? 1 : 0)

    mhr=208 - (0.7* age)
    if(level == 3)
      heartRate = mhr*0.9
    elsif(level == 2)
      heartRate = mhr*0.8
    elsif(level == 1)
      heartRate = mhr*0.6
    end

    if(!heart.blank?)
      heartRate = heart
    end

    if(profile.gender == 1)
      cal = ((-55.0969 + (0.6309 * heartRate.to_i) + (0.1988 * profile.weight.to_i) + (0.2017 * age.to_i) ) / 4.184) * (time.to_i/60)
    else
      cal = ((-20.4022 + (0.4472 * heartRate.to_i) - (0.1263 * profile.weight.to_i) + (0.074 * age.to_i))/4.184) * (time.to_i/60)
    end
    return cal
  end
end
