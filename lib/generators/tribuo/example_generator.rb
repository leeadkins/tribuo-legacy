module Tribuo
  module Generators
    class ExampleGenerator < Rails::Generators::Base 
      desc "Loads sample family data into the database."
      def load_sample_data
        lastnameOptions = ["Smith", "Jones", "Anderson", "Blevins", "Caldwell", "Duggan"]
        firstnameOptions = ["Ashley", "Bruce", "Chuck", "David", "Earl", "Fannie"]
        phoneOptions = ["942-2525", "837-8484", "658-1234"]
        street = ["Elm", "Oak", "2nd", "1st", "Magnolia", "Any", "Montrosa", "Laurel"]
        type = ["Street", "Ave", "Road", "Hwy"]
        city = ["Whitwell", "Jasper", "South Pittsburg"]
        sizeOptions = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        childrenOptions = [1, 2, 3]
        foodOptions = [true, false]
        pickupOptions = [true, false]

        25.times do
        Family.create([
            {
              :lastname => lastnameOptions[rand(lastnameOptions.length)],
              :firstname => firstnameOptions[rand(firstnameOptions.length)],
              :phone => phoneOptions[rand(phoneOptions.length)],
              :address => "#{rand(999)} #{street[rand(street.length)]} #{type[rand(type.length)]} #{city[rand(city.length)]}",
              :familysize => sizeOptions[rand(sizeOptions.length)],
              :childrensize => childrenOptions[rand(childrenOptions.length)],
              :foodonly => foodOptions[rand(foodOptions.length)],
              :pickup => pickupOptions[rand(pickupOptions.length)]
            }
          ])
        end
      end
    end
  end
end