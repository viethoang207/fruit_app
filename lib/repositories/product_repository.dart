import 'package:injectable/injectable.dart';

import '../models/product/product.dart';

@singleton
class ProductRepository {
  List<Product> getListProduct(String category) {
    late Product sample;
    switch (category) {
      case 'ORGANIC':
        sample = const Product(
            id: "F8bf01vGyuFsn7leBcdL",
            category: "ORGANIC",
            name: "AHOY NUTS CRUNCHY ORGANIC PEANUT BUTTER 375G",
            title: "Ahoy Nuts Crunchy Organic Peanut Butter",
            description:
            "Ahoy Nuts Certified Organic Peanut Butter is produced by grinding high quality peanuts. They are no artificial sweeteners, gluten free and preservatives free. Great tasting Roasted Nuts! Made with 100% Organic Roasted and Ground Peanuts. You’ll love the fantastic flavour Two consistencies - crunchy and smooth.",
            dolar: 3.99,
            unit: "1.06 / 100g",
            images: [
              "https://www.harrisfarm.com.au/cdn/shop/products/650164-done_1024x1024.jpg?v=1607223597",
              "https://www.harrisfarm.com.au/cdn/shop/products/650164-nutri-done_1024x1024.jpg?v=1607223635"
            ]);
        break;
      case 'FRUIT':
        sample = const Product(
            id: "OMuDzuQlFpOtowRIk4Y1",
            category: "FRUIT",
            name: "APPLE GRANNY SMITH ORGANIC 1KG",
            title: "Apples Granny Smith Organic",
            description:
            "This is the classic green apple. It's a great, fresh-eating apple that ripens earlier than other varieties. It's hard, crisp and has a tart flavour. A good source of dietary fibre, vitamin C and potassium.  Organic farming involves much more than not using chemical pesticides and fertilisers. Organic farming helps to minimise any negative impacts on the environment, maintaining biodiversity of the ecosystem whilst also delivering a nutritious product.",
            dolar: 10.99,
            unit: "10.99 / kg",
            images: [
              "https://www.harrisfarm.com.au/cdn/shop/products/74072-done_1024x1024.jpg?v=1621473496",
              "https://www.harrisfarm.com.au/cdn/shop/products/74072-organic-granny-done_1024x1024.jpg?v=1568677768"
            ]);
        break;
      case 'VEGGIES':
        sample = const Product(
            id: "3Hg5cuk3hrAkO6hQnSgk",
            category: "VEGGIES",
            name: "BEETROOT ORGANIC 500G",
            title: "Beetroot Organic",
            description:
            "Beetroot is an earthy, root vegetable rich in antioxidants. Beetroot can be eaten raw, roasted or boiled and is a source of fibre, potassium and Vitamin C.\nIt utilises organic farming to ensure production involves much more than not using chemical pesticides and fertilisers. This helps to minimise any negative impacts on the environment, maintaining biodiversity of the ecosystem whilst also delivering a nutritious product.",
            dolar: 4.99,
            unit: "9.98 / kg",
            images: [
              "https://www.harrisfarm.com.au/cdn/shop/products/71142-done_1024x1024.jpg?v=1568677768",
            ]);
        break;
      case 'GROCERY':
        sample = const Product(
            id: "WqYWW6jnOZJ77IkcGIYk",
            category: "GROCERY",
            name: "180 DEGREES 4 SEED ORIGINAL CRACKERS 150G",
            title: "180 Degrees 4 Seed Original Crackers ",
            description:
                "Sensational Super Seeds!\nA delicious healthy, crunchy snack to eat with pate, dips, spreads or cheese.\nPerfect on their own.\nCrunchy, tasty Linseed, Black and White Sesame and Chia seeds, full of flavour.\nMade with 100% pure Natural New Zealand Oats and 100% NZ Butter.\nHigh in Fibre and packed full of natural goodness.\nIngredients:\nOats (42%), Butter (Cream), Tapioca Starch, Linseed (7%), Sesame Seeds (Black and White 7%), Chia Seeds (6%), Brown Sugar, Sea Salt, Baking Powder, Cream of Tartar",
            dolar: 5.99,
            unit: "3.99 / 100g",
            images: [
              "https://www.harrisfarm.com.au/cdn/shop/products/180_Degrees-4_Seed_Oat_Crackers-Original-1-Square-_1200x1200px_1024x1024.jpg?v=1643876573",
            ]);
        break;
    }
    return List.filled(10, sample);
  }
}
