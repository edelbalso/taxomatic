class Numeric
  def round_up_to_nickel

    newnum = self.to_f * 100.to_f
    newnum = newnum.to_i # truncate everything under the pennies

    # do the rounding in integers
    unless newnum % 5 == 0
      newnum += 5 - (newnum % 5)
    end

    #convert back to float
    newnum.to_f / 100.to_f
  end
end
