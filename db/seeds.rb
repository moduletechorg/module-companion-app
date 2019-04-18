# Seed Home Features for User profile
Feature.create(name: 'Energy Efficiency')
Feature.create(name: 'Sustainable Materials')
Feature.create(name: 'Architectural-Level Design')
Feature.create(name: 'Small Footprint')

# Seed Location Perks for User profile
LocationPerk.create(name: 'Proximity to nature')
LocationPerk.create(name: 'Proximity to public transit')
LocationPerk.create(name: 'Having a yard')
LocationPerk.create(name: 'Proxmity to grocery stores')

# Seed Neighbhorhoods
lawrenceville = Neighborhood.create(name: 'Lawrenceville', city: 'Pittsburgh', state: 'PA', mapframe: 'https://www.google.com/maps/embed/v1/place?q=place_id:ChIJ6Rdn2lLyNIgRE86PqbGEIps&key=AIzaSyCo6_JIQStF9vp0daZX3wYPZmicLbp5BN0', description: "Lawrenceville is one of the largest neighborhood areas in Pittsburgh in the U.S. state of Pennsylvania. It is located northeast of downtown, and like many of the city's riverfront neighborhoods, it has an industrial past.")
east_liberty = Neighborhood.create(name: 'East Liberty', city: 'Pittsburgh', state: 'PA', mapframe: 'https://www.google.com/maps/embed/v1/place?q=place_id:ChIJe_nZ1JrtNIgRUfnYozINi54&key=AIzaSyCo6_JIQStF9vp0daZX3wYPZmicLbp5BN0', description: "Up-and-coming East Liberty is home to trendy restaurants run by acclaimed chefs, boutique hotels and community institutions like the Kelly Strayhorn Theater, showcasing original dance, drama and music. Artisan glassware and glass artwork are on display at the Pittsburgh Glass Center arts school. Nearby, the Bakery Square development houses hip clothing stores, offices and casual eateries in a former cracker factory.")
garfield = Neighborhood.create(name: 'Garfield', city: 'Pittsburgh', state: 'PA', mapframe: "https://www.google.com/maps/embed/v1/place?q=place_id:ChIJrYSfl2jyNIgRsMhj9BQMfIk&key=AIzaSyCo6_JIQStF9vp0daZX3wYPZmicLbp5BN0", description: "Garfield is a neighborhood in the East End of the City of Pittsburgh, Pennsylvania, United States. Garfield is bordered on the South by Bloomfield and Friendship, on the West by the Allegheny Cemetery, on the North by Stanton Heights, and on the East by East Liberty.")
friendship = Neighborhood.create(name: 'Friendship', city: 'Pittsburgh', state: 'PA', mapframe: 'https://www.google.com/maps/embed/v1/place?q=place_id:ChIJp59a5WzyNIgRrEoM3nbS_Iw&key=AIzaSyCo6_JIQStF9vp0daZX3wYPZmicLbp5BN0', description: "Friendship is a neighborhood of large Victorian houses in the East End of the City of Pittsburgh, Pennsylvania, United States, about four miles east of Pittsburgh's Golden Triangle.")
bloomfield = Neighborhood.create(name: 'Bloomfield', city: 'Pittsburgh', state: 'PA', mapframe: 'https://www.google.com/maps/embed/v1/place?q=place_id:ChIJ0X4ZRUHyNIgRDG3KutmxB2g&key=AIzaSyCo6_JIQStF9vp0daZX3wYPZmicLbp5BN0', description: "
Bloomfield, known as Pittsburgh’s Little Italy, is an eclectic neighborhood with a wide-ranging dining scene that includes pizzerias and old-school Italian spots, as well as global eateries, hip cafes and burger joints. Lively taverns host bands and DJs, and classic dive bars buzz after dark. Liberty Avenue has independent shops selling records, books and secondhand clothes.")
mt_washington = Neighborhood.create(name: 'Mt Washington', city: 'Pittsburgh', state: 'PA', mapframe: 'https://www.google.com/maps/embed/v1/place?q=place_id:ChIJV3bAVrP2NIgRuiaDB0cLHTg&key=AIzaSyCo6_JIQStF9vp0daZX3wYPZmicLbp5BN0', description: "Charming Mount Washington is known for its panoramic city views, from spots including Grandview Avenue’s Restaurant Row, home to upscale seafood and Italian restaurants. The Monongahela and Duquesne Inclines are funiculars that climb the hill to lookouts like Grandview Overlook. Point of View Park has a bronze sculpture of George Washington with Seneca leader Guyasuta, while Emerald View Park is laced with trails.")
carnegie = Neighborhood.create(name: 'Carnegie Township', city: 'Carnegie', state: 'PA', mapframe: 'https://www.google.com/maps/embed/v1/place?q=carnegie%20township%20&key=AIzaSyCo6_JIQStF9vp0daZX3wYPZmicLbp5BN0', description: "Carnegie is a borough in Allegheny County, Pennsylvania, United States, and is part of the Pittsburgh Metro Area. The population was 7,972 in the 2010 census.")

# Seed Lots
ngraham402 = Land.create(address: "402 N Graham St", neighborhood_id: garfield.id, mapframe: 'https://www.google.com/maps/d/u/0/embed?mid=1IO_7pU_k7RmM5_iW4Ka30b9Vuxhzf60_', why_we_like_it: "- Close to Penn Ave commercial corridor - Accessible to other neighborhoods")
elane = Land.create(address: "Carnegeie E-Lane", neighborhood_id: carnegie.id, mapframe: "https://www.google.com/maps/d/u/0/embed?mid=1NG54WCBT2aekHzpqVm3HoNrUnZtX9Jc-", why_we_like_it: "Carnegie is a borough 15 mins outside from Downtown Pittsburgh. The lot is proximate to Carnegie Main Street Area and easy to drive to many shopping centers around the area.")


# Seed Nearby Locations for Lots
NearbyLocation.create(name: 'A | BFG Cafe', land_id: ngraham402.id, within_10: true)
NearbyLocation.create(name: 'B | Commonplace Coffee-Voluto', land_id: ngraham402.id, within_10: true)
NearbyLocation.create(name: 'C | Spork', land_id: ngraham402.id, within_10: true)
NearbyLocation.create(name: 'D | Alia Musica Pittsburgh', land_id: ngraham402.id, within_10: true)
NearbyLocation.create(name: 'E | Pittsburgh Glass Center', land_id: ngraham402.id, within_10: true)
NearbyLocation.create(name: 'A | Whole Foods Market', land_id: ngraham402.id, within_mile: true)
NearbyLocation.create(name: 'B | Market District', land_id: ngraham402.id, within_mile: true)
NearbyLocation.create(name: "C | Trader Joe's", land_id: ngraham402.id, within_mile: true)
NearbyLocation.create(name: 'D | Noodlehead', land_id: ngraham402.id, within_mile: true)
NearbyLocation.create(name: 'E | Target', land_id: ngraham402.id, within_mile: true)

NearbyLocation.create(name: 'A | D & O Wine Cellars', land_id: elane.id, within_10: true)
NearbyLocation.create(name: 'B | Aldi', land_id: elane.id, within_10: true)
NearbyLocation.create(name: 'C | Carnegie Coffee Company', land_id: elane.id, within_10: true)
NearbyLocation.create(name: "D | Duran's Restaurant & Lounge", land_id: elane.id, within_10: true)
NearbyLocation.create(name: "E | Andrew Carnegie Free Library & Music Hall", land_id: elane.id, within_10: true)
NearbyLocation.create(name: 'A | Bakn Carnegie', land_id: elane.id, within_mile: true)
NearbyLocation.create(name: 'B | Carnegie Park', land_id: elane.id, within_mile: true)
NearbyLocation.create(name: 'C | Insurrection AleWorks', land_id: elane.id, within_mile: true)
NearbyLocation.create(name: 'D | Professional and Amateur Pinball Association Headquarters', land_id: elane.id, within_mile: true)
NearbyLocation.create(name: 'E | Marshalls', land_id: elane.id, within_mile: true)
