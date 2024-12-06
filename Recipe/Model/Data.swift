//
//  Data.swift
//  Recipe
//
//  Created by IS 543 on 11/29/24.
//
// Koleton helped explain to me some ideas on the logic for the data; however, I did this by myself. I did use Chat GPT to take my existing recipes and turn them into the format I wanted

import SwiftData
import Foundation

func Data(context: ModelContext) {
        let allCategory = Category(name: "All")
        let appCategory = Category(name: "Appetizer")
        let breakCategory = Category(name: "Breakfast")
        let dessCategory = Category(name: "Dessert")
        let breadCategory = Category(name: "Bread")
        let snackCategory = Category(name: "Snacks")
        let dinCategory = Category(name: "Dinner")
        let drinksCategory = Category(name: "Drinks")
    
    let cookieRecipe = Recipe(
        name: "Oatmeal Chocolate Chip and M&M Cookies",
        instructions: """
            Preheat oven to 375°F. 
            In a large bowl, cream together the butter, sugars, and vanilla until light and fluffy. 
            Beat in the eggs one at a time. 
            In another bowl, combine the flour, baking soda, and salt; gradually add to the creamed mixture. 
            Stir in the oats, chocolate chips, and M&Ms. 
            Drop by rounded spoonfuls onto an ungreased baking sheet. 
            Bake for 9-12 minutes or until golden brown. 
            Allow to cool on baking sheet for 2 minutes, then transfer to wire racks to cool completely.
        """,
        ingredients: """
            - 1 cup butter flavored shortening (regular works fine)
            - 1 cup sugar
            - ½ cup brown sugar
            - 2 eggs
            - 2 teaspoons vanilla
            - 2 cups flour
            - 1 teaspoon salt
            - 1 teaspoon baking soda
            - 1 cup oats
            - 1 cup chocolate chips
            - 1 cup M&Ms
        """,
        categories: [dessCategory, allCategory],
        servings: 24,
        time: 45,
        author: "Melanie Winder",
        dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
        favorite: true,
        notes: """
            These cookies are perfect for parties and gatherings. T
            he combination of oats, chocolate chips, and M&Ms makes them a crowd favorite!
        """
    )
    
    let chipperCookieRecipe = Recipe(
        name: "Chunky Chipper Cookies",
        instructions: """
            Preheat oven to 375°F. 
            In a large bowl, cream together the butter, sugars, and vanilla. 
            Beat peanut butter, shortening, eggs, sugar, vanilla, and water until creamy. 
            Add sifted dry ingredients and blend well. 
            Stir in chocolate chips. 
            Bake 10-12 min at 350.
        """,
        ingredients: """
            - 2 cups flour
            - 1 teaspoon baking soda
            - ½ teaspoon salt
            - 1/2 cup shortening
            - 1/2 cup peanut butter
            - 1/2 cup brown sugar
            - 1 teaspoon vanilla
            - 1 tablespoon water
            - 1 12 oz package of chocolate chips
        """,
        categories: [dessCategory, allCategory],
        servings: 24,
        time: 45,
        author: "Melanie Winder",
        dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
        favorite: true,
        notes: """
            The big milk chocolate chips are the best
        """
    )
    
    let tacoSoupRecipe = Recipe(
        name: "Taco Soup",
        instructions: """
            Saute onions in olive oil. 
            Brown ground beef and remove fat. 
            Combine and stir in taco seasoning. 
            Add all other things. Simmer for 20min.
        """,
        ingredients: """
            - 1 lb ground beef
            - 1 onion
            - 1 can corn or frozen
            - 1 can dark red kidney beans
            - 1 package taco seasing or 3 tablespoons
            - 1 8oz can tomato sauce (15 oz work too)
            - 1 28 oz can stewed tomatoes
        """,
        categories: [allCategory, dinCategory],
        servings: 4,
        time: 60,
        author: "Melanie Winder",
        dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
        favorite: false,
        notes: """
        """
    )
    
    let hamFriedRiceRecipe = Recipe(
        name: "Ham Fried Rice",
        instructions: """
            Cook rice the day before. 
            Spread out and dry (if no time, that’s okay). Heat oil and add rice. Stir a few min. 
            Add onions, ham, and veg. Stir and heat. 
            Carefully pour beaten egg and stir until egg is cooked
        """,
        ingredients: """
            - 6 cups cooked rice
            - 2 tablespoons oil
            - 1/2 cup green onions
            - 1 cup ham
            - 2 eggs beaten
            - 1 lb frozen peas and carrots
        """,
        categories: [allCategory, dinCategory],
        servings: 10,
        time: 50,
        author: "Melanie Winder",
        dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
        favorite: false,
        notes: """
        """
    )
    
    let broccoliRecipe = Recipe(
        name: "Broccoli and Cheese",
        instructions: """
            Peel and slice thick stems from broccoli. 
            Bring ¾ C water to simmer over medium low heat. 
            Add stems and florets: cook, covered, until bright green, 4 min. 
            Stir in olive oil, garlic, salt, and red pepper. 
            Cook 4 min. 
            Turn off heat. 
            Stir in vinegar.
        """,
        ingredients: """
            - 1 1/2 lb broccoli
            - 4 1/2 tablespoons olive oil
            - 1 minced garlic clove
            - 1/4 teaspoon salt
            - 1/8 teaspoon crushed red pepper
            - 1 1/2 teaspoon vinegar
        """,
        categories: [allCategory, appCategory],
        servings: 10,
        time: 10,
        author: "Melanie Winder",
        dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
        favorite: false,
        notes: """
        """
    )
    
    let zucchiniBreadRecipe = Recipe(
        name: "Mom's Zucchini Bread",
        instructions: """
            Grease and flour two 8 x 4 inch pans. 
            Preheat oven to 325 degrees F (165 degrees C). 
            Sift flour, salt, baking powder, soda, and cinnamon together in a bowl. 
            Beat eggs, oil, vanilla, and sugar together in a large bowl. 
            Add sifted ingredients to the creamed mixture, and beat well. 
            Stir in zucchini and nuts until well combined. 
            Pour batter into prepared pans. 
            Bake for 40 to 60 minutes, or until tester inserted in the center comes out clean. 
            Cool in pan on rack for 20 minutes. 
            Remove bread from pan, and completely cool.
        """,
        ingredients: """
            - 3 cups all purpose flour
            - 1 teaspoon salt
            - 1 teaspoon baking soda
            - 1 teaspoon baking powder
            - 1 tablespoon ground cinnamon
            - 3 large eggs
            - 1 cup vegetable oil
            - 2 1/4 cups white sugar
            - 3 teaspoons vanilla extract
            - 2 cups grated zucchini
            - 1 cup walnuts
        """,
        categories: [allCategory, breadCategory],
        servings: 10,
        time: 80,
        author: "Melanie Winder",
        dateAdded: ISO8601DateFormatter().date(from: "2024-11-25T00:00:00Z") ?? Date(),
        favorite: false ,
        notes: """
        """
    )
    
    let noBakeCookiesRecipe = Recipe(
        name: "No Bake Cookies",
        instructions: """
            Boil the first four ingredients together for 1 min. 
            Take off heat and add oatmeal, peanut butter, and vanilla. Stir well. 
            Drop by spoonful on waxed paper or buttered pan.
        """,
        ingredients: """
            - ½ cup milk
            - 2 cups sugar
            - 1 square butter (½ cup)
            - 3-4 tablespoons cocoa
            - 3 cups oatmeal
            - ¾ cup chunky peanut butter
            - 1 teaspoon vanilla
        """,
        categories: [dessCategory, allCategory],
        servings: 25,
        time: 120,
        author: "Melanie Winder",
        dateAdded: Date(),
        favorite: false,
        notes: """
        """
    )

    let molassesSugarCookiesRecipe = Recipe(
        name: "Molasses Sugar Cookies",
        instructions: """
            Add sugar, oil, molasses, and egg. Beat well. 
            Sift dry ingredients and add to mixture. Stir well. 
            Form into 1 in balls. Roll in granulated sugar. Space far apart. 
            Bake at 350°F for 7 min.
        """,
        ingredients: """
            - ¾ cup oil
            - 1 cup sugar
            - ¼ cup molasses
            - 1 egg
            - 2 teaspoons baking soda
            - 2 cups sifted flour
            - ½ teaspoon cloves
            - ½ teaspoon ginger
            - 1 teaspoon cinnamon
            - ½ teaspoon salt
        """,
        categories: [dessCategory, allCategory],
        servings: 40,
        time: 30,
        author: "Melanie Winder",
        dateAdded: Date(),
        favorite: false,
        notes: """
        """
    )

    let chocolatePeanutButterChipCookiesRecipe = Recipe(
        name: "Chocolate Peanut Butter Chip Cookies",
        instructions: """
            Cream eggs and sugar. Add rest of the ingredients. 
            Bake at 350°F for 8-10 minutes.
        """,
        ingredients: """
            - 2 cubes margarine, softened
            - 2 cups sugar
            - 2 eggs
            - 2 teaspoons vanilla
            - 1 teaspoon baking soda
            - ½ teaspoon salt
            - ¾ cup cocoa
            - 2 cups flour
            - 1 package peanut butter chips
        """,
        categories: [dessCategory, allCategory],
        servings: 20,
        time: 30,
        author: "",
        dateAdded: Date(),
        favorite: true,
        notes: """
            This is a Winder family favorite
        """
    )

    let snickerdoodlesRecipe = Recipe(
        name: "Snickerdoodles",
        instructions: """
            Sift dry ingredients and mix with other ingredients. 
            Roll into walnut-sized balls and coat in a mixture of sugar and cinnamon. 
            Bake at 400°F for 8-10 minutes (11 min in Washington).
        """,
        ingredients: """
            - 2 cups shortening
            - 3 cups sugar
            - 4 eggs
            - 5 ½ cups sifted flour
            - 4 teaspoons cream of tartar
            - 4 teaspoons baking soda
            - ½ teaspoon salt
            - Mixture: 2 tablespoons sugar + 2 teaspoons cinnamon
        """,
        categories: [dessCategory, allCategory],
        servings: 50,
        time: 60,
        author: "Melanie Winder",
        dateAdded: Date(),
        favorite: false,
        notes: """
        """
    )

    let doubletreeChocolateChipCookiesRecipe = Recipe(
        name: "Doubletree Chocolate Chip Cookies",
        instructions: """
            Cream butter, sugar, and brown sugar in a stand mixer. 
            Add eggs, vanilla, and lemon juice, blending until light and fluffy. 
            Mix in dry ingredients on low speed. 
            Stir in chocolate chips and walnuts. 
            Portion dough onto a baking sheet. 
            Bake at 300°F for 20-23 minutes. 
            Cool on sheet for 1 hour.
        """,
        ingredients: """
            - ½ pound butter (2 sticks), softened
            - ¾ cup + 1 tablespoon granulated sugar
            - ¾ cup packed light brown sugar
            - 2 large eggs
            - 1 ¼ teaspoons vanilla extract
            - ¼ teaspoon freshly squeezed lemon juice
            - 2 ¼ cups flour
            - ½ cup rolled oats
            - 1 teaspoon baking soda
            - 1 teaspoon salt
            - Pinch cinnamon
            - 2 ⅔ cups semi-sweet chocolate chips
            - 1 ¾ cups chopped walnuts
        """,
        categories: [dessCategory, allCategory],
        servings: 26,
        time: 160,
        author: "Double Tree Hotel",
        dateAdded: Date(),
        favorite: false,
        notes: """
            Dough can be frozen. Bake frozen at 300°F until edges are golden.
        """
    )

    let gingerChocolateChipCookiesRecipe = Recipe(
        name: "Ginger Chocolate Chip Cookies",
        instructions: """
            Cream together butter, vanilla, egg, and brown sugar. 
            Mix remaining dry ingredients separately and add to the creamed mixture. 
            Stir in chocolate chips. 
            Chill dough for 1 hour. 
            Roll each ball of dough in powdered sugar. 
            Bake at 375°F for 8-10 minutes.
        """,
        ingredients: """
            - 1 cup butter
            - 1 teaspoon vanilla
            - 1 egg
            - 1 ½ cups brown sugar
            - ½ teaspoon salt
            - 2 ½ cups flour
            - 1 teaspoon baking soda
            - 1 teaspoon cinnamon
            - ½ teaspoon ginger
            - Chocolate chips to liking
        """,
        categories: [dessCategory, allCategory],
        servings: 15,
        time: 90,
        author: "Melanie Winder",
        dateAdded: Date(),
        favorite: true,
        notes: """
        """
    )

    let pearsonsFavoriteSugarCookiesRecipe = Recipe(
        name: "Pearson’s Favorite Sugar Cookies",
        instructions: """
            Cream shortening and sugar. 
            Add eggs, salt, vanilla, baking powder, milk, and flour. Mix well. 
            Roll to desired thickness. 
            Bake at 350°F for 10 minutes.
        """,
        ingredients: """
            - 1 ⅓ cups shortening
            - 1 ⅓ cups sugar
            - 4 eggs
            - ½ cup milk
            - 2 teaspoons vanilla
            - 6 teaspoons baking powder
            - 5 cups flour (more if necessary)
            - ¼ teaspoon salt
        """,
        categories: [dessCategory, allCategory],
        servings: 25,
        time: 100,
        author: "Loralee Pearson",
        dateAdded: Date(),
        favorite: false,
        notes: """
        """
    )
    
    let nutterButterPieRecipe = Recipe(
        name: "Nutter Butter Pie",
        instructions: """
            Crust:
            Preheat oven to 350. 
            Mix crushed Nutter Butter cookies and melted butter together in a bowl. 
            Press mixture into bottom and up the sides of a 9” pie pan, using the back of a glass measuring cup if necessary to pack down. 
            Bake 12 min until golden and set. Allow to cool completely.
            
            Filling:
            In a bowl of stand mixer beat cream cheese, peanut butter and marshmallow fluff together until smooth. 
            In another bowl, beat the heavy cream until stiff peaks form. 
            Stir whipped cream into cream cheese mixture. 
            Finally stir in crushed cookies. Spread this all over cool crust.
            
            Topping:
            Beat the heavy cream with the powdered sugar until stiff peaks form. 
            Spread on top of cream cheese filling. 
            If desired, heat peanut butter for 30 seconds until it becomes “drizzle-able” and drizzle on top of whipped cream.
            
            Chill pie for at least 2 hours before serving. Store refrigerated for up to 2 days.
        """,
        ingredients: """
            Crust:
            - 24 Nutter Butter Cookies, crushed
            - 6 T salted butter, melted
            
            Filling:
            - 8 oz. cream cheese, room temperature
            - 1 cup marshmallow fluff
            - ⅓ cup creamy peanut butter
            - 1 cup heavy cream
            - 12 Nutter Butter Cookies, crushed
            
            Topping:
            - ½ cup heavy cream
            - 1 T powdered sugar
            - ¼ cup creamy peanut butter, warmed and drizzled on top
        """,
        categories: [dessCategory, allCategory],
        servings: 8,
        time: 120,
        author: "All Recipes",
        dateAdded: Date(),
        favorite: true,
        notes: """
            This is a Thanksgiving staple
        """
    )
    
    let cranberrySlushRecipe = Recipe(
        name: "Grandma Winder’s Cranberry Slush",
        instructions: """
            Dissolve sugar in boiling water. 
            Combine with the remaining ingredients and freeze. 
            When ready to serve, crush with an ice pick and serve with 7-up.
        """,
        ingredients: """
            - 2 cups White sugar
            - 1 quart cranberry juice
            - 1 T lemon juice
            - 1 C boiling water
            - 1 quart orange juice
        """,
        categories: [drinksCategory, allCategory],
        servings: 12,
        time: 240,
        author: "Arliss Winder",
        dateAdded: Date(),
        favorite: false,
        notes: """
        """
    )

    let lemonZucchiniBreadRecipe = Recipe(
        name: "Lemony Raspberry Zucchini Bread",
        instructions: """
            Preheat oven to 350⁰F. Grease and flour a 9×5″ loaf pan, set aside.
            In large bowl, blend flour, baking powder, and salt.
            In the mixer bowl of a stand mixer/medium-sized bowl, beat 2 eggs well. 
            Then add oil and sugar, and beat on low until well combined. 
            Add the milk, lemon juice, and lemon zest; blend everything well.
            Gently mix in the zucchini until just evenly distributed in mixture.
            Add dry ingredients and fold everything together, but don’t over mix!
            Lastly, fold in the raspberries.
            Pour the batter into the loaf pan.
            Bake for 45 minutes or until toothpick inserted in center comes out clean. 
            Cool in pan 10 minutes then remove to a wire rack and cool completely.
            While the loaf is cooling, in small bowl, mix the powdered sugar and lemon juice until well blended. 
            Spoon the glaze over the cooled loaf. Let the glaze set prior to slicing and serving.
        """,
        ingredients: """
            Bread:
            - 2 cups unbleached all-purpose flour
            - 2 teaspoon baking powder
            - ½ teaspoon salt
            - 2 eggs
            - ½ cup vegetable oil
            - 2/3 cup sugar
            - ½ cup whole milk
            - ¼ cup fresh lemon juice
            - Zest of 1 lemon
            - 1 cup grated zucchini
            - 1 cup of raspberries
            
            Glaze:
            - 1 cup powdered sugar
            - 1 Tablespoon fresh lemon juice
        """,
        categories: [dessCategory, allCategory, breadCategory],
        servings: 10,
        time: 120,
        author: "All Recipes",
        dateAdded: Date(),
        favorite: false,
        notes: ""
    )

    let bananaBreadRecipe = Recipe(
        name: "Banana Bread",
        instructions: """
            Cream sugar and butter together. 
            Mix in other ingredients. 
            Sprinkle top with brown sugar (optional). 
            Bake 1hr at 350. (For muffins, bake at 400 for 16-20 min)
        """,
        ingredients: """
            - ½ C butter/shortening/margarine
            - 1 C sugar
            - 2 eggs
            - 3 ripe bananas
            - ½ t salt
            - 2 C flour
            - 1 t baking soda
        """,
        categories: [dessCategory, allCategory],
        servings: 12,
        time: 120,
        author: "Melanie Winder",
        dateAdded: Date(),
        favorite: true,
        notes: """
            It usually takes longer than it says.
        """
    )

    let frenchBreadRecipe = Recipe(
        name: "French Bread",
        instructions: """
            Let the yeast bubble in the water and then add the rest of it. 
            It’s a lot of flour, and sometimes I don’t get all the way to 7 cups before I get tired of adding it. 
            Start with about 3C and add the rest in ½ - 1C. It’s a pretty stiff dough. 
            Knead for 5 min. Let it rise 1hr. Punch down. 
            Roll into 2 rectangles, roll up to make 2 long loaves. 
            Put them on cookie sheet w/Pam and slit top with knife. Let rise another hr and bake about 410 for 20 min. 
            Put butter on top when done.
            (If baking in a double pan for long baguettes, bake 20 min then turn and bake 10 min more)
        """,
        ingredients: """
            - 2 ½ C warm water
            - 2 T yeast
            - 1 T salt
            - 1 T butter, margarine, or shortening
            - 6-7 C flour
        """,
        categories: [breadCategory, allCategory],
        servings: 8, // Adjust serving size if known
        time: 120, // Adjust time if known
        author: "Melanie Winder", // Add author if available
        dateAdded: Date(),
        favorite: false, // Adjust as per preference
        notes: """
        """
    )
    
    let pumpkinBreadRecipe = Recipe(
        name: "Pumpkin Bread",
        instructions: """
            Beat sugar and oil together, add eggs separately. 
            Beat well after each addition. 
            Add pumpkin and dry ingredients and chocolate chips. 
            Pour into 2 pans. 
            Bake at 350 for 1 hour 20 minutes.
        """,
        ingredients: """
            - 1 C oil
            - 3 C sugar
            - 4 eggs
            - 3 C pumpkin (1 large can)
            - 3 ½ C flour
            - 2 t baking soda
            - 1 t salt
            - 1 t cloves
            - 1 t nutmeg
            - 1 t cinnamon
            - 1 t baking powder
            - 2 C chocolate chips
        """,
        categories: [breadCategory, allCategory],
        servings: 10,
        time: 120,
        author: "Jessica Clark",
        dateAdded: Date(),
        favorite: false,
        notes: ""
    )
    
    let amishWhiteBreadRecipe = Recipe(
        name: "Amish White Bread",
        instructions: """
            In a large bowl, dissolve the sugar in warm water, and then stir in yeast. 
            Allow to proof until yeast resembles a creamy foam.
            Mix salt and oil into the yeast. Mix in flour one cup at a time. 
            Knead dough on a lightly floured surface until smooth. 
            Place in a well-oiled bowl, and turn dough to coat. 
            Cover with a damp cloth. Allow to rise until doubled in bulk, about 1 hour.
            Punch dough down. Knead for a few minutes, and divide in half. 
            Shape into loaves, and place into two well-oiled 9x5 inch loaf pans. 
            Allow to rise for 30 minutes, or until dough has risen 1 inch above pans.
            Bake at 350 degrees F (175 degrees C) for 30 minutes.
        """,
        ingredients: """
            - 2 C warm water
            - ⅔ C sugar
            - 1 ½ T active dry yeast
            - 1 ½ t salt
            - ¼ C vegetable oil
            - 6 C bread flour
        """,
        categories: [breadCategory, allCategory],
        servings: 15,
        time: 150,
        author: "AllRecipes",
        dateAdded: Date(),
        favorite: true,
        notes: """
        """
    )
    
    let roastedAsparagusRecipe = Recipe(
        name: "Roasted Asparagus",
        instructions: """
            Snap ends off the asparagus. 
            Lay in a single layer on a baking sheet and add olive oil, salt, and pepper. 
            Toss with hands.
            Preheat oven to 400°F and cook for less than 15 minutes.
        """,
        ingredients: """
            - Asparagus
            - 1-2 T olive oil
            - Salt
            - Pepper
        """,
        categories: [appCategory, allCategory],
        servings: 5,
        time: 20,
        author: "Unknown",
        dateAdded: Date(),
        favorite: false,
        notes: """
        """
    )

    let lemonChickenOrzoRecipe = Recipe(
        name: "Lemon Chicken Orzo Pasta",
        instructions: """
            Heat 2 teaspoons of the olive oil in a large non-stick or cast iron skillet over medium-high heat. 
            When the skillet is hot add in the chicken and season with salt and pepper. 
            Sauté until the chicken is thoroughly cooked then remove it from the skillet onto a plate.
            Add the remaining 1 teaspoon of olive oil to the skillet then add in the onion. 
            Sauté for one minute or until the onion starts to soften.
            Add in the orzo and garlic and sauté for about a minute. 
            Pour in the chicken broth, stir everything together and bring it to a boil.
            Once boiling, cover with a lid and reduce the heat to medium-low. 
            Simmer for approximately 5 minutes and then add the asparagus. 
            Simmer covered for an additional 5 minutes, then add the spinach. 
            Cook for one minute or until spinach is wilted. 
            Remove the lid and if there is any excess liquid remaining continue to cook uncovered for another minute.
            Add the cooked chicken back into the skillet and stir in the lemon zest, lemon juice and Parmesan cheese until everything is combined. 
            Garnish with more Parmesan cheese, if desired. 
            Serve immediately and enjoy!
        """,
        ingredients: """
            - 3 teaspoons olive oil
            - 1 pound boneless skinless chicken breasts, cut into bite-sized pieces
            - salt and pepper
            - 1/4 cup chopped onion
            - 1 cup orzo
            - 2 cloves garlic, minced
            - 2 1/4 cups low-sodium chicken broth
            - 1 cup fresh asparagus, cut into 1-inch pieces
            - 3 to 5 ounces spinach, or kale
            - zest and juice from one lemon
            - 1/2 cup shredded Parmesan cheese, plus more for serving
        """,
        categories: [dinCategory, allCategory],
        servings: 6,
        time: 80,
        author: "a magazine",
        dateAdded: Date(),
        favorite: true,
        notes: """
        """
    )

    let cheesyTacoOrzoRecipe = Recipe(
        name: "One Pot Cheesy Taco Orzo",
        instructions: """
            Add the ground beef to a large skillet and brown it over medium-high heat until it's no longer pink, breaking it up as you go along.
            Add the chopped onion and garlic to the skillet and let it cook for about a minute, then add the chopped bell pepper. 
            Stir everything together and cook for about 3 minutes until the onion is translucent and the pepper is tender.
            Add the dry orzo to the skillet and turn the heat down to medium low. 
            Stir in the taco skillet sauce and the chicken broth, season with salt and pepper then add the hot sauce. 
            Cook for about 10 to 12 minutes or until all of the liquid is absorbed, stirring occasionally.
            Stir in the cheese and remove from heat.
            Top with tomatoes, olives, green onions and fresh cilantro before serving.

        """,
        ingredients: """
            - 1 lb ground beef
            - 1 small onion, chopped
            - 3 cloves garlic, minced
            - 1 red bell pepper, chopped
            - 2 cups orzo, uncooked
            - 2 cups taco skillet sauce
            - 2 1/2 cups low-sodium chicken broth
            - 1/2 tsp salt
            - 1/4 tsp pepper
            - 1 tbsp hot sauce (e.g., Sriracha)
            - 1 cup shredded cheese (Mozzarella and Cheddar blend)
        """,
        categories: [dinCategory, allCategory],
        servings: 6,
        time: 120,
        author: "a magazine",
        dateAdded: Date(),
        favorite: false,
        notes: """
            You can substitute taco skillet sauce with regular taco or enchilada sauce.
            You can use ground turkey or chicken instead of beef. 
            If you can't find orzo, small pastas such as shells or farfalle will work as well. 
            If you use rice as a substitute, make sure to adjust the amount of chicken broth to suit the cooking instructions for the rice you're using. 
            Please keep in mind that nutritional information is a rough estimate and can vary greatly based on products used.
        """
    )

    let germanPancakesRecipe = Recipe(
        name: "German Pancakes",
        instructions: """
                Melt 3T butter in a 13x9 pan. 
                Add above ingredients (already mixed). 
                Bake at 450°F for 20 min.
            """,
        ingredients: """
            - 6 eggs
            - 1 cup milk
            - 1 cup flour
            - 1/4 tsp salt
            - 3 tbsp butter
        """,
        categories: [breakCategory, allCategory],
        servings: 6,
        time: 30,
        author: "Melanie Winder",
        dateAdded: Date(),
        favorite: false,
        notes: """
        """
    )

    let greenBeanCasseroleRecipe = Recipe(
        name: "Green Bean Casserole",
        instructions: """
            Peel and cook potatoes then mash. 
            Brown hamburger and onions. Drain beans and add them to burger, add soup. 
            Place hamburger mixture in baking dish. 
            Cover with potatoes. Grate cheese over top. 
            Cover and bake at 325°F for 30 minutes or until cheese is melted and casserole is bubbly.
        """,
        ingredients: """
            - 1/2 can green beans
            - 1 lb hamburger
            - 5 medium potatoes
            - 1 can tomato soup
            - 1 medium onion
            - grated cheese
        """,
        categories: [dinCategory, allCategory],
        servings: 7,
        time: 120,
        author: "Lion House",
        dateAdded: Date(),
        favorite: false,
        notes: """
        """
    )

    let macNCheeseRecipe = Recipe(
        name: "Mac ‘n Cheese",
        instructions: """
            Take the vegetable oil and melt with the butter. 
            Once melted, whisk in flour. 
            After about 3 min, add milk. 
            Stir until thickened and add the first round of cheese. 
            Add spices. Add cooked macaroni. 
            Stir it up and put it in a 9by13 pan and top with the rest of the cheese and breadcrumbs.
            Put it in the oven on broil until browned.
        """,
        ingredients: """
            - 1 tbsp vegetable oil
            - 2 tbsp butter
            - 3 tbsp flour
            - 1 1/2 cups milk (2% or whole)
            - 2 cups cheese
            - Cayenne pepper
            - Nutmeg
            - Salt
            - Cooked macaroni
            - 1 cup cheese (Cheddar and Parmesan)
            - Breadcrumbs
        """,
        categories: [dinCategory, allCategory, snackCategory],
        servings: 6,
        time: 60,
        author: "Jacob Anderson",
        dateAdded: Date(),
        favorite: false,
        notes: """
        """
    )

    let sloppyJoesRecipe = Recipe(
        name: "Sloppy Joes II",
        instructions: """
            In a medium skillet over medium heat, brown the ground beef, onion, and green pepper. 
            Drain off liquids.
            Stir in the garlic powder, mustard, ketchup, and brown sugar; mix thoroughly. 
            Reduce heat, and simmer for 30 minutes. 
            Season with salt and pepper.
        """,
        ingredients: """
            - 1 pound lean ground beef
            - 1/4 cup chopped onion
            - 1/4 cup chopped green bell pepper
            - 1/2 tsp garlic powder
            - 1 tsp prepared yellow mustard
            - 3/4 cup ketchup
            - 3 tsp brown sugar
            - salt, to taste
            - ground black pepper, to taste
        """,
        categories: [allCategory, dinCategory],
        servings: 6,
        time: 60,
        author: "AllRecipes",
        dateAdded: Date(),
        favorite: false,
        notes: """
        """
    )
    
    let prezsChickenRecipe = Recipe(
        name: "Marinate Sauce (Prez’s Chicken)",
        instructions: """
            Marinate meat in the sauce for two to four hours, depending on how strong of a marinade flavor is desired in the meat.
        """,
        ingredients: """
            - 1 cup peanut oil
            - 1/2 cup lemon juice
            - 1 cup soy sauce
        """,
        categories: [dinCategory, allCategory],
        servings: 4,
        time: 240,
        author: "Maughn Pearson",
        dateAdded: Date(),
        favorite: false,
        notes: ""
    )

    let lionHouseLasagnaRecipe = Recipe(
        name: "Lion House Lasagna",
        instructions: """
            Brown ground beef in oil. Drain. 
            Add garlic, parsley flakes, basil, and salt.
            Mix with tomatoes and tomato paste. 
            Simmer, uncovered, until thick, about one hour; stir occasionally. 
            Cook lasagna noodles as directed on package; drain and rinse in cold water. 
            Mix cottage cheese with beaten eggs, pepper, parsley flakes and Parmesan cheese. 
            Place half of noodles in 9by13 baking pan. 
            Spoon on half the cottage cheese mixture. 
            Repeat the layers, ending with layer of mozzarella on top. 
            Bake at 375°F for 30 minutes.
        """,
        ingredients: """
            - 1 to 1 1/2 lbs ground beef
            - 1 clove garlic, minced
            - 1 tbsp basil
            - 1 20 oz can stewed tomatoes
            - 1 6 oz can tomato paste
            - 1 10 oz package lasagna noodles
            - 2 eggs, beaten
            - 2 tbsp parsley flakes
            - 1 lb mozzarella cheese, thinly sliced
            - 1 1/2 tbsp oil
            - 2 tsp salt
            - 3 cups large-curd cheese
            - 1/2 tsp pepper
            - 1/2 cup grated Parmesan cheese
        """,
        categories: [dinCategory, allCategory],
        servings: 6,
        time: 120,
        author: "Lion House",
        dateAdded: Date(),
        favorite: true,
        notes: """
        """
    )

    let russianTeaRecipe = Recipe(
        name: "Russian Tea",
        instructions: """
            Make a simple syrup by heating 2 cups water and 2 cups sugar until dissolved.
            Heat. When dissolved, add remaining ingredients.
            Heat to the desired temperature and serve.
        """,
        ingredients: """
            - 2 cups white sugar
            - 2 cups water (for syrup)
            - 2 quarts water
            - 2 cups orange juice, reconstituted
            - 1/4 cup lemon juice, reconstituted
            - 1 tsp vanilla extract
            - 1 tsp almond extract
        """,
        categories: [dessCategory, allCategory],
        servings: 6,
        time: 30,
        author: "Brandon Winder",
        dateAdded: Date(),
        favorite: false,
        notes: """
            This is my Dad's favorite drink since he served in Russia.
        """
    )



        
    
    // Save the data to the context
    context.insert(allCategory)
    context.insert(appCategory)
    context.insert(breakCategory)
    context.insert(dessCategory)
    context.insert(breadCategory)
    context.insert(snackCategory)
    context.insert(dinCategory)
    context.insert(drinksCategory)
    
    allCategory.recipes.append(cookieRecipe)
    dessCategory.recipes.append(cookieRecipe)
    
    allCategory.recipes.append(chipperCookieRecipe)
    dessCategory.recipes.append(chipperCookieRecipe)
    
    allCategory.recipes.append(tacoSoupRecipe)
    dinCategory.recipes.append(tacoSoupRecipe)
    
    allCategory.recipes.append(hamFriedRiceRecipe)
    dinCategory.recipes.append(hamFriedRiceRecipe)
    
    allCategory.recipes.append(broccoliRecipe)
    appCategory.recipes.append(broccoliRecipe)
    
    allCategory.recipes.append(zucchiniBreadRecipe)
    breadCategory.recipes.append(zucchiniBreadRecipe)
    
    allCategory.recipes.append(chocolatePeanutButterChipCookiesRecipe)
    dessCategory.recipes.append(chocolatePeanutButterChipCookiesRecipe)
    
    allCategory.recipes.append(doubletreeChocolateChipCookiesRecipe)
    dessCategory.recipes.append(doubletreeChocolateChipCookiesRecipe)
    
    allCategory.recipes.append(gingerChocolateChipCookiesRecipe)
    dessCategory.recipes.append(gingerChocolateChipCookiesRecipe)
    
    allCategory.recipes.append(molassesSugarCookiesRecipe)
    dessCategory.recipes.append(molassesSugarCookiesRecipe)
    
    allCategory.recipes.append(noBakeCookiesRecipe)
    dessCategory.recipes.append(noBakeCookiesRecipe)
    
    allCategory.recipes.append(pearsonsFavoriteSugarCookiesRecipe)
    dessCategory.recipes.append(pearsonsFavoriteSugarCookiesRecipe)
    
    allCategory.recipes.append(snickerdoodlesRecipe)
    dessCategory.recipes.append(snickerdoodlesRecipe)
    
    allCategory.recipes.append(nutterButterPieRecipe)
    dessCategory.recipes.append(nutterButterPieRecipe)
    
    allCategory.recipes.append(cranberrySlushRecipe)
    drinksCategory.recipes.append(cranberrySlushRecipe)
    
    allCategory.recipes.append(lemonZucchiniBreadRecipe)
    breadCategory.recipes.append(lemonZucchiniBreadRecipe)
    dessCategory.recipes.append(lemonZucchiniBreadRecipe)
    
    allCategory.recipes.append(bananaBreadRecipe)
    breadCategory.recipes.append(bananaBreadRecipe)
    
    allCategory.recipes.append(frenchBreadRecipe)
    breadCategory.recipes.append(frenchBreadRecipe)
    
    allCategory.recipes.append(pumpkinBreadRecipe)
    breadCategory.recipes.append(pumpkinBreadRecipe)
    
    allCategory.recipes.append(amishWhiteBreadRecipe)
    breadCategory.recipes.append(amishWhiteBreadRecipe)
    
    allCategory.recipes.append(roastedAsparagusRecipe)
    appCategory.recipes.append(roastedAsparagusRecipe)
    
    allCategory.recipes.append(lemonChickenOrzoRecipe)
    dinCategory.recipes.append(lemonChickenOrzoRecipe)
    
    allCategory.recipes.append(cheesyTacoOrzoRecipe)
    dinCategory.recipes.append(cheesyTacoOrzoRecipe)
    
    allCategory.recipes.append(germanPancakesRecipe)
    breakCategory.recipes.append(germanPancakesRecipe)
    
    allCategory.recipes.append(greenBeanCasseroleRecipe)
    dinCategory.recipes.append(greenBeanCasseroleRecipe)
    
    allCategory.recipes.append(macNCheeseRecipe)
    dinCategory.recipes.append(macNCheeseRecipe)
    snackCategory.recipes.append(macNCheeseRecipe)
    
    allCategory.recipes.append(sloppyJoesRecipe)
    dinCategory.recipes.append(sloppyJoesRecipe)
    
    allCategory.recipes.append(prezsChickenRecipe)
    dinCategory.recipes.append(prezsChickenRecipe)
    
    allCategory.recipes.append(lionHouseLasagnaRecipe)
    dinCategory.recipes.append(lionHouseLasagnaRecipe)
    
    allCategory.recipes.append(russianTeaRecipe)
    drinksCategory.recipes.append(russianTeaRecipe)
    
    context.insert(cookieRecipe)
    context.insert(chipperCookieRecipe)
    context.insert(tacoSoupRecipe)
    context.insert(hamFriedRiceRecipe)
    context.insert(broccoliRecipe)
    context.insert(zucchiniBreadRecipe)
    context.insert(chocolatePeanutButterChipCookiesRecipe)
    context.insert(doubletreeChocolateChipCookiesRecipe)
    context.insert(gingerChocolateChipCookiesRecipe)
    context.insert(molassesSugarCookiesRecipe)
    context.insert(noBakeCookiesRecipe)
    context.insert(pearsonsFavoriteSugarCookiesRecipe)
    context.insert(nutterButterPieRecipe)
    context.insert(cranberrySlushRecipe)
    context.insert(lemonZucchiniBreadRecipe)
    context.insert(bananaBreadRecipe)
    context.insert(frenchBreadRecipe)
    context.insert(pumpkinBreadRecipe)
    context.insert(amishWhiteBreadRecipe)
    context.insert(roastedAsparagusRecipe)
    context.insert(lemonChickenOrzoRecipe)
    context.insert(cheesyTacoOrzoRecipe)
    context.insert(germanPancakesRecipe)
    context.insert(greenBeanCasseroleRecipe)
    context.insert(prezsChickenRecipe)
    context.insert(lionHouseLasagnaRecipe)
    context.insert(russianTeaRecipe)
    context.insert(macNCheeseRecipe)
    context.insert(sloppyJoesRecipe)
    
    do {
        try context.save()
        print("Recipe and category relationship saved successfully!")
    } catch {
        print("Error saving data: \(error)")
    }
    
    //try? context.save()
}
