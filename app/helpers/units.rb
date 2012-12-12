module Units

  def Units.convert_units(amount, unit)
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
        raise "Units.convert_units: Unknown unit #{unit}. Try again, sucker."
    end
  end

end
