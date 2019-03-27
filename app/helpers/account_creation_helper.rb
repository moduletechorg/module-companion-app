module AccountCreationHelper
  def housing_options
    [
      ["I'm looking for a single family home for myself/family", 'primary'],
      ["I'm looking for an investment prorperty", 'investment'],
      ["I'm looking for a vacation home/secondary residence", 'secondary']
    ]
  end

  def current_housing
    [
      ["Own", 'own'],
      ["Rent", 'rent'],
      ["I live with my parents", 'parents'],
      ["Other", 'other']
    ]
  end

  def current_type_housing
    [
      ["Apartment", 'apartment'],
      ["Townhome", 'townhome'],
      ["Condo", 'condo'],
      ["House", 'house'],
      ["Other", 'other']
    ]
  end

  def current_size_housing
    [
      ['Studio', 0],
      ['1 Bedroom', 1],
      ['2 Bedroom', 2],
      ['3 Bedroom', 3],
      ['4+ Bedrooms', 4]
    ]
  end

  def living_with
    [
      ['I live by myself', 'alone'],
      ['I live with a roommate(s)', 'roommate'],
      ['I live with my spouse/partner', 'partner'],
      ['I live with my spouse/partner and kids', 'partner_kids'],
      ['I live with my kids', 'kids']
    ]
  end

  def num_kids
    [
      ['None', 0],
      ['1', 1],
      ['2', 2],
      ['3', 3],
      ['4+', 4]
    ]
  end

  def location_perks
    [
      ['Being in a neighborhood', 'neighborhood'],
      ['Walkability', 'walkability'],
      ['School District', 'school_district'],
      ['Proximity to grocery stores and restaurants', 'food'],
      ['Proximity to parks', 'parks']
    ]
  end

  def preferred_bedroom
    [
      ['1 Bedroom', 1],
      ['2 Bedroom', 2],
      ['3 Bedroom', 3],
      ["Not sure, I'd like Module to help me out", 0]
    ]
  end

  def preferred_bathroom
    [
      ['1 Bath', 1.0],
      ['1.5 Bath', 1.5],
      ['2 Bath', 2.0],
      ['I definitely need more than 2!', 0]
    ]
  end

  def move_in_time
    [
      ['6-12 months', '6-12 months'],
      ['12-18 months', '12-18 months'],
      ['18 months - 2 years', '18 months - 2 years'],
      ['2+ years', '2+ years']
    ]
  end

  def budget
    [
      ['<$200K', 200],
      ['$200K-$250K', 250],
      ['$250K-$300K', 300],
      ['$300K-$350K', 350],
      ['$350K-$400K', 400],
      ['$400K-$450K', 450],
      ['$450K+', 0 ]
    ]
  end

  def down_payment_amount
    [
      ['<$5K', 5],
      ['$5K-$15K', 15],
      ['$15K-$25K', 25],
      ['$25K-$35K', 35],
      ['$35K-$45K', 45],
      ['$45K+', 0]
    ]
  end

end
