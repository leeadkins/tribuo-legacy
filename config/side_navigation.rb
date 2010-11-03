SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|

    primary.item :families, "Families", families_path do |family|
      family.item :add_family, "Add Family", new_family_path
    end
    primary.dom_class = 'main_menu'
  end

end