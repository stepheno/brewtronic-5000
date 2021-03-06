module Units

  def Units.convert_mass_units(amount, unit)
    case unit
      when "lb" 
        amount.to_f.lb.to_kg.value
      when "g" 
        amount.to_f.g.to_kg.value
      when "oz" 
        amount.to_f.oz.to_kg.value
      when "kg"
        amount
      else
        raise "Units.convert_mass_units: Unknown unit #{unit}. Try again, sucker."
    end
  end

  def Units.convert_volume_units(amount, unit)
    case unit
      when "gal" 
        amount.to_f.gal.to_L.value
      when "bbl" 
        amount.to_f.bbl_fl_us.to_L.value
      when "l" 
        amount
      else
        raise "Units.convert_volume_units: Unknown unit #{unit}. Try again, sucker."
    end
  end

  def Units.convert_density_units(amount, unit)
    case unit
      when "sg" 
        Units.sg_to_plato(amount.to_f)
      when "plato" 
        amount.to_f
      else
        raise "Units.convert_density_units: Unknown unit #{unit}. Try again, sucker."
    end
  end

  def Units.convert_temp_units(amount, unit)
    case unit
      when "C"
        amount
      when "F"
        amount.to_f.deg_f.to_deg_c.value
      else
        raise "Units.convert_temp_units: Unknown unit #{unit}. Try again, sucker."
    end
  end

  def Units.format_temp_for_user(amount,user)
    if not user.nil?
      case user.temp_units
        when "F"
          amount.deg_c.to_deg_f.round!(2)
        when "C"
          amount.deg_c.round!(2)
        else
          raise "Units.format_temp_for_user: Unknown unit #{user.temp_units}."
      end
    else
      amount.deg_c.round!(2)
    end
  end

  def Units.format_mass_for_user(amount,user)
    if not user.nil?
      case user.mass_units
        when "lb"
          amount.kg.to_lb.round!(2)
        when "kg"
          amount.kg.round!(2)
        else
          raise "Units.format_mass_for_user: Unknown unit #{user.mass_units}."
      end
    else
      amount.kg.round!(2)
    end
  end

  def Units.format_volume_for_user(amount,user)
    if not user.nil?
      case user.volume_units
        when "gal"
          amount.L.to_gal.round!(2)
        when "bbl"
          amount.L.to_bbl_fl_us.round!(2)
        when "l"
          amount.L.round!(2)
        else
          raise "Units.format_volume_for_user: Unknown unit #{user.volume_units}."
      end
    else
      amount.L.round!(2)
    end
  end

  def Units.format_density_for_user(amount,user)
    unless user.nil?
      case user.density_units
        when "sg"
          Units.plato_to_sg(amount).round(3)
        when "plato"
          amount.round(2)
        else
          raise "Units.format_density_for_user: Unknown unit #{user.volume_units}."
      end
    else
      amount.round(2)
    end
  end

  def Units.plato_to_sg(plato)
    specific_gravity = 1 + plato/(258.6-((plato/258.2)*227.1))
  end

  def Units.sg_to_plato(sg)
    plato = -676.67 + (1286.4 * sg) - (800.47 * sg**2) + (190.74 * sg**3)
  end

end
