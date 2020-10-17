# require "open-uri"
# require "nokogiri"
# require_relative "recipe"

# class ScrapeMarmitonService
#   def initialize(ingredient)
#     @ingredient = ingredient
#   end

#   def call
#     html = open("http://www.marmiton.org/recettes/recherche.aspx?aqt=#{@ingredient}").read
#     # 1. Parse HTML
#     doc = Nokogiri::HTML(html, nil, "utf-8")
#     # 2. For the first five results
#     results = []
#     doc.search(".recipe-card").first(5).each do |element|
#       # 3. Create recipe and store it in results
#       name = element.search('.recipe-card__title').text.strip
#       description = element.search('.recipe-card__description').text.strip
#       prep_time = element.search('.recipe-card__duration__value').text.strip
#       results << Recipe.new(name: name, description: description, prep_time: prep_time)
#     end
#     return results
#   end

#   def import
#     # 1. Ask user for a keyword
#     term = @view.ask_user_for("search")
#     # 2. Scrape BBC Good Food
#     # results = ScrapeBBCGoodFoodService.new(term).call
#     # Uncomment next line if you want to scrape Marmiton
#     results = ScrapeMarmitonService.new(term).call
#     # 3. Display results
#     @view.display(results)
#     # 4. Ask for the recipe to import
#     index = @view.ask_user_for_index
#     # 5. Add to cookbook
#     @cookbook.add(results[index])
#     # 6. Display
#     display_recipes
#   end
# end
