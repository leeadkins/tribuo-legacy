SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.item :add_family, "New Family", new_family_path
    primary.item :families, "Filters", families_path do |family|
      family.item :add_family, "All", families_path
      family.item :flagged_family, "Flagged", families_path(:flagged => true)
    end
    primary.dom_class = 'main_menu'
  end

end