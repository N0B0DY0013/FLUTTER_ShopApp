
import './providers/product.dart';

 List<Product> DUMMY_DATA = [
  Product(
    id: "p1",
    title: "Lays Classic",
    description: "Thinly sliced potato chips with a classic salty flavor.",
    price: 1.99,
    imageUrl: "https://images.freshop.com/1564405684712978043/2157df3d26331a40f1b93816cb45ed2d_large.png"
  ),
  Product(
    id: "p2",
    title: "Doritos Nacho Cheese",
    description: "Crunchy corn tortilla chips with a bold nacho cheese flavor.",
    price: 2.49,
    imageUrl: "https://d2t3trus7wwxyy.cloudfront.net/catalog/product/cache/d166c7ea81ddc4172de536322110c911/d/o/doritos-tortilla-nacho-cheesier-7oz_1.jpg"
  ),
  Product(
    id: "p3",
    title: "Pringles Original",
    description: "Stackable potato crisps with a unique saddle shape.",
    price: 1.79,
    imageUrl: "https://images.kglobalservices.com/www.pringles.com.uk/en_gb/product/product_6598149/prod_img-6598525_05053990138722_a1n1.png"
  ),
  Product(
    id: "p4",
    title: "Cheetos Crunchy",
    description: "Cheese-flavored crunchy puffs with a distinctive orange color.",
    price: 1.29,
    imageUrl: "https://csistore.ph/wp-content/uploads/2020/07/Cheetos-Crunchy-8oz.jpg"
  ),
  Product(
    id: "p5",
    title: "Terra Blues Chips",
    description: "Blue potato chips with a rich, earthy flavor and vibrant color.",
    price: 2.99,
    imageUrl: "https://images-na.ssl-images-amazon.com/images/I/51itBTrVAzL.jpg"
  ),
  Product(
    id: "p6",
    title: "Ruffles All Dressed",
    description: "Ruffled potato chips seasoned with a blend of various flavors.",
    price: 2.19,
    imageUrl: "https://images-na.ssl-images-amazon.com/images/I/51aVgxFVAfL.jpg"
  ),
  Product(
    id: "p7",
    title: "Tostitos Scoops",
    description: "Scoop-shaped tortilla chips for dipping into salsa and other dips.",
    price: 2.69,
    imageUrl: "https://m.media-amazon.com/images/I/71BaKSzpyBL._SL1500_.jpg"
  ),
  Product(
    id: "p8",
    title: "Popchips Sea Salt",
    description: "Popped potato chips with a light and airy texture.",
    price: 2.29,
    imageUrl: "https://images.freshop.com/1564405684713462820/a78572c7a8b3ff0ebedf67d8fef1179b_large.png"
  ),
  Product(
    id: "p9",
    title: "Pringles Sour Cream & Onion",
    description: "Stackable potato crisps with a tangy sour cream and onion flavor.",
    price: 1.79,
    imageUrl: "https://images.freshop.com/00038000138430/7564c23a82fdc9f6908757564beedd32_large.png"
  ),
  Product(
    id: "p10",
    title: "Ruffles Regular Nature",
    description: "Specially selected potatoes, vegetable oil, salt. Gluten-Free. Ruffles Regular chips will be a grand slam at your next party.",
    price: 2.49,
    imageUrl: "https://i5.walmartimages.com/asr/55c4505f-254b-4f2a-abcc-1358ac012ce6.224a1afb454e1acd9b90db84de767b17.jpeg?odnHeight=2000&odnWidth=2000&odnBg=ffffff"
  ),
  Product(
    id: "p11",
    title: "Lays BBQ",
    description: "Potato chips with a smoky and tangy barbecue flavor.",
    price: 1.99,
    imageUrl: "https://cf.shopee.ph/file/f6463efd6665f65f0f63d5e58849cad5"
  ),
  Product(
    id: "p12",
    title: "SunChips Original",
    description: "Multigrain chips with a hearty crunch and a touch of salt.",
    price: 2.59,
    imageUrl: "https://m.media-amazon.com/images/I/81FVPKX1wTL._SL1500_.jpg"
  ),
  Product(
    id: "p13",
    title: "Cheetos Puffs",
    description: "Cheese-flavored puffy snacks that melt in your mouth.",
    price: 1.29,
    imageUrl: "https://images.freshop.com/8148029/23d0526103108edd6e22bf9f6d0b92f9_large.png"
  ),
  Product(
    id: "p14",
    title: "Takis Fuego",
    description: "Rolled corn tortilla chips with a fiery chili and lime flavor.",
    price: 1.49,
    imageUrl: "https://i.ebayimg.com/images/g/PUQAAOSwHrxkDtYc/s-l1200.webp"
  ),
  Product(
    id: "p15",
    title: "Ruffles Cheddar & Sour Cream",
    description: "Ruffled potato chips with a bold cheddar and sour cream seasoning.",
    price: 2.19,
    imageUrl: "https://down-ph.img.susercontent.com/file/cb3aa73c5f96baab0640199b6f4cad7c"
  ),
  Product(
    id: "p16",
    title: "Doritos Spicy Sweet Chili",
    description: "Corn tortilla chips with a sweet and spicy chili flavor.",
    price: 2.49,
    imageUrl: "https://i.ebayimg.com/images/g/HBMAAOSw4BVgTQCr/s-l1600.jpg"
  ),
  Product(
    id: "p17",
    title: "Pringles Cheddar Cheese",
    description: "Stackable potato crisps with a rich cheddar cheese taste.",
    price: 1.79,
    imageUrl: "https://images.freshop.com/00038000138577/456c7da10becf5dc475cddde25058735_large.png"
  ),
  Product(
    id: "p18",
    title: "Lays Sour Cream & Onion",
    description: "Potato chips with a tangy sour cream and onion seasoning.",
    price: 1.99,
    imageUrl: "https://csistore.ph/wp-content/uploads/2020/07/Lays-Potato-Chips-Sour-Cream-Onion-6.50z.jpg"
  ),
  Product(
    id: "p19",
    title: "Popcorners Kettle Corn",
    description: "Popped corn chips with a sweet and salty kettle corn flavor.",
    price: 2.39,
    imageUrl: "https://shop.healthyoptions.com.ph/cdn/shop/products/810607020710_01.jpg?v=1625642904"
  ),
  Product(
    id: "p20",
    title: "Kettle Brand Sea Salt",
    description: "Kettle-cooked potato chips seasoned with a touch of sea salt.",
    price: 2.79,
    imageUrl: "https://m.media-amazon.com/images/I/61lVsym6i6L.jpg"
  ),
  Product(
    id: "p21",
    title: "Tostitos Hint of Lime",
    description: "Tortilla chips with a hint of zesty lime flavor.",
    price: 2.69,
    imageUrl: "https://i.ebayimg.com/images/g/Qf0AAOSwD6pg52M7/s-l1200.webp"
  ),
  Product(
    id: "p22",
    title: "Fritos Original",
    description: "Corn chips with a hearty crunch and a simple, salty flavor.",
    price: 1.49,
    imageUrl: "https://m.media-amazon.com/images/I/91Ol8+ElQzL._SL1500_.jpg"
  ),
  Product(
    id: "p23",
    title: "Cape Cod Original",
    description: "Kettle-cooked potato chips with an extra crunchy texture.",
    price: 2.99,
    imageUrl: "https://res.cloudinary.com/nassau-candy/image/upload/c_fit,w_1000,h_1000,f_auto/v1544468428/967820.jpg"
  ),
  Product(
    id: "p24",
    title: "Lays Salt & Vinegar",
    description: "Potato chips with a tangy salt and vinegar seasoning.",
    price: 1.99,
    imageUrl: "https://down-ph.img.susercontent.com/file/a00f2ba3e8a003564dcd40a4dd5f91db"
  ),
  Product(
    id: "p25",
    title: "Snyder's of Hanover Pretzel Pieces",
    description: "Pretzel chunks seasoned with various bold flavors.",
    price: 2.89,
    imageUrl: "https://m.media-amazon.com/images/I/81ru62GDucL._SL1500_.jpg"
  ),
  Product(
    id: "p26",
    title: "Doritos Salsa Verde",
    description: "Corn tortilla chips with a zesty and tangy salsa verde flavor.",
    price: 2.49,
    imageUrl: "https://m.media-amazon.com/images/I/91Dt5Kxv+IL._SL1500_.jpg"
  ),
  Product(
    id: "p27",
    title: "Ruffles Sour Cream & Onion",
    description: "Ruffled potato chips with a creamy and tangy sour cream and onion seasoning.",
    price: 2.19,
    imageUrl: "https://ph-test-11.slatic.net/p/a49b0407ca249c460d5e43f7d757de2c.jpg"
  ),
  Product(
    id: "p28",
    title: "Miss Vickie's Sea Salt & Vinegar",
    description: "Kettle-cooked potato chips with a bold sea salt and vinegar flavor.",
    price: 2.99,
    imageUrl: "https://m.media-amazon.com/images/I/91Zl-uX1gqL.jpg"
  ),
  Product(
    id: "p29",
    title: "Popchips BBQ",
    description: "Popped potato chips with a smoky and tangy barbecue seasoning.",
    price: 2.29,
    imageUrl: "https://i.ebayimg.com/images/g/1rwAAOSwGE9gZEZc/s-l1200.webp"
  ),
  Product(
    id: "p30",
    title: "Lays Cheddar & Sour Cream",
    description: "Potato chips with a creamy cheddar and tangy sour cream flavor.",
    price: 1.99,
    imageUrl: "https://images.freshop.com/8148053/09c4323a658147483c50ab4844bc9a04_large.png"
  ),
  Product(
    id: "p31",
    title: "Tostitos Original",
    description: "Classic tortilla chips for dipping into your favorite salsa.",
    price: 2.69,
    imageUrl: "https://ph-test-11.slatic.net/p/16d0780fd42a01f1bbff2f5402fc50c8.jpg"
  ),
  Product(
    id: "p32",
    title: "Ruffles Queso",
    description: "Ruffled potato chips with a zesty queso cheese flavor.",
    price: 2.19,
    imageUrl: "https://m.media-amazon.com/images/I/812m0TN-p0L._SL1500_.jpg"
  ),
  Product(
    id: "p33",
    title: "Cheetos Flamin' Hot",
    description: "Spicy and fiery cheese-flavored puffs for heat lovers.",
    price: 1.29,
    imageUrl: "https://cf.shopee.ph/file/517fa678bf4be954c026c3a276c779b9"
  ),
  Product(
    id: "p34",
    title: "Lays Limón",
    description: "Potato chips with a refreshing and tangy lime flavor.",
    price: 1.99,
    imageUrl: "https://i.ebayimg.com/images/g/-58AAOSwle5jENrG/s-l1200.webp"
  ),
  Product(
    id: "p35",
    title: "Doritos Cool Ranch",
    description: "Corn tortilla chips with a cool and zesty ranch flavor.",
    price: 2.49,
    imageUrl: "https://i.ebayimg.com/images/g/VLsAAOSwOVpXXLI6/s-l1200.jpg"
  ),
  Product(
    id: "p36",
    title: "Popchips Sour Cream & Onion",
    description: "Popped potato chips with a tangy sour cream and onion seasoning.",
    price: 2.29,
    imageUrl: "https://popchips.com/cdn/shop/files/POP-0.8oz-SourCreamOnion-80850-10-3D-FRONT_1200x.png?v=1701879204"
  ),
  Product(
    id: "p37",
    title: "SunChips Harvest Cheddar",
    description: "Multigrain chips with a bold cheddar cheese flavor.",
    price: 2.59,
    imageUrl: "https://m.media-amazon.com/images/I/81Gd9HPSd6L._AC_UF894,1000_QL80_.jpg"
  ),
  Product(
    id: "p38",
    title: "Pringles BBQ",
    description: "Stackable potato crisps with a smoky and tangy barbecue flavor.",
    price: 1.79,
    imageUrl: "https://d2t3trus7wwxyy.cloudfront.net/catalog/product/1/0/10236235_pringles_barbeque_5.5oz.jpeg"
  ),
  Product(
    id: "p39",
    title: "Kettle Brand Jalapeño",
    description: "Kettle-cooked potato chips with a spicy jalapeño kick.",
    price: 2.79,
    imageUrl: "https://m.media-amazon.com/images/I/7100pHYa9pL._SL1500_.jpg"
  ),
  Product(
    id: "p40",
    title: "Doritos Roulette",
    description: "Corn tortilla chips with a mix of spicy and non-spicy chips in one bag.",
    price: 2.49,
    imageUrl: "https://images.heb.com/is/image/HEBGrocery/001897194?fit=constrain,1&wid=800&hei=800&fmt=jpg&qlt=85,0&resMode=sharp2&op_usm=1.75,0.3,2,0"
  ),
  Product(
    id: "p41",
    title: "Lays Flamin' Hot",
    description: "Spicy and fiery potato chips for heat enthusiasts.",
    price: 1.99,
    imageUrl: "https://m.media-amazon.com/images/I/51-774lWqgL.jpg"
  ),
  Product(
    id: "p42",
    title: "Tostitos Multigrain",
    description: "Multigrain tortilla chips with a wholesome and hearty crunch.",
    price: 2.69,
    imageUrl: "https://images-cdn.ubuy.co.in/6354fc0ff19c3c21ab5eb5a5-tostitos-scoops-multigrain-tortilla.jpg"
  ),
  Product(
    id: "p43",
    title: "Ruffles Loaded Bacon & Cheddar Potato Skins",
    description: "Ruffled potato chips with a flavor inspired by loaded potato skins.",
    price: 2.19,
    imageUrl: "https://images.heb.com/is/image/HEBGrocery/001963045-1"
  ),
  Product(
    id: "p44",
    title: "Cape Cod Sweet & Spicy Jalapeño",
    description: "Kettle-cooked potato chips with a balance of sweetness and jalapeño heat.",
    price: 2.99,
    imageUrl: "https://www.capecodchips.com/wp-content/uploads/2020/05/jalapeno.jpg"
  ),
  Product(
    id: "p45",
    title: "Kettle Brand Salt & Fresh Ground Pepper",
    description: "Kettle-cooked potato chips seasoned with sea salt and freshly ground pepper.",
    price: 2.79,
    imageUrl: "https://www.kettlebrand.com/wp-content/uploads/2020/11/321125_Kettle_Chips_SaltPepper_ORGANIC_5oz_8411410597_FRONT-1.png"
  ),
  Product(
    id: "p46",
    title: "Doritos Blaze",
    description: "Corn tortilla chips with a bold and spicy blaze of flavor.",
    price: 2.49,
    imageUrl: "https://i5.walmartimages.com/seo/Doritos-Blaze-Tortilla-Chips-9-75-Oz_160131db-c460-4421-b241-448e4cb831df_1.bccb985be3aa50eec26a9b105891eafc.jpeg"
  ),
  Product(
    id: "p47",
    title: "Lays Garden Tomato & Basil",
    description: "Potato chips with a garden-fresh blend of tomato and basil flavors.",
    price: 1.99,
    imageUrl: "https://i5.walmartimages.com/seo/Lay-s-Garden-Tomato-Basil-Flavored-Potato-Chips-2-75-oz-Bag_7d8fa367-9445-44f0-b751-655ccee945c1_1.7357a3c7cbf5dd6291d425a71304489c.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF"
  ),
  Product(
    id: "p48",
    title: "Kettle Brand Backyard BBQ",
    description: "Kettle-cooked potato chips with the smoky and savory taste of a backyard BBQ.",
    price: 2.79,
    imageUrl: "https://d2t3trus7wwxyy.cloudfront.net/catalog/product/1/0/10158553---kettle-chips-backyard-bbq-5oz.jpg"
  ),
  Product(
    id: "p49",
    title: "Terra Mediterranean",
    description: "Exotic vegetable chips with flavors inspired by the Mediterranean region.",
    price: 2.99,
    imageUrl: "https://images.heb.com/is/image/HEBGrocery/001420196"
  ),
  Product(
    id: "p50",
    title: "Ruffles Cheddar Jalapeño",
    description: "Ruffled potato chips with a zesty combination of cheddar and jalapeño.",
    price: 2.19,
    imageUrl: "https://i5.walmartimages.com/asr/dd9c6a21-a189-46bb-aafd-a867af6eb788.770626f3dd4d16400a068147687df89e.jpeg?odnHeight=2000&odnWidth=2000&odnBg=ffffff"
  )
];
