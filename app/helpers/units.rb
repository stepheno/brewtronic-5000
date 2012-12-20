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
        amount.to_f.bbl.to_L.value
      when "l" 
        amount
      else
        raise "Units.convert_volume_units: Unknown unit #{unit}. Try again, sucker."
    end
  end

end
