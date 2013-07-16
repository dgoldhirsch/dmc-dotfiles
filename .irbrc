class << self
  def new_sss_for(district)
    c = district.configuration.deep_dup
    result = district.service_schedule_sets.build(:configuration => c, :name => "Otto")
    c.configurable = result
    result
  end

  def new_targeted_sss_for(district)
    result = new_sss_for(district)
    result.targeted!
    result
  end

  def sss(district)
    if district.to_i != 0
      district = District.find_by_id(district)
    end

    result = new_sss_for(district)
    result.save!
    result
  end

  def tsss(district)
    if district.to_i != 0
      district = District.find_by_id(district)
    end

    result = new_targeted_sss_for(district)
    result.save!
    result
  end
end