CREATE TABLE authors (
  author_id SERIAL PRIMARY KEY,
  authorpic varchar(255),
  email varchar(255),
  name varchar(255),
  slug varchar(255),
  bio varchar(50000),
);

INSERT INTO authors (authorpic, email, name, slug, bio)
VALUES
  ('./assets/authors/maxine_mustermann.png', 'maxine_mustermann@authors.com', 'Maxine Mustermann', 'Self-proclaimed kitchen goddess and mother of two.', 'Maxine Ross Mustermann is a 33-year-old government politician who enjoys stealing candy from babies, relaxing and escapology. She is Expert and Adventurous, but can also be very Serious and a bit impatient.

She is German. She has a post-graduate degree in philosophy, politics and economics.

Physically, Maxine is in pretty good shape. She is tall with fair skin, grey hair and brown eyes. She has an unusually long nose.

She grew up in an upper class neighbourhood. Her parents separated when she was small, but remained friends and provided a happy, stable home.

She is currently married to Max Mustermann. Max is 19 years older than her and is the most employed man in Germany.

Her best friend is a government politician called Michael Sanders. They are inseparable. She also hangs around with Lukas Thomas and Katrina Arnold. They enjoy horse riding together.

And she loves food!',
  ('./assets/authors/sandi_sanders.png', 'sandi@sandisbakeshop.com', 'Sandi Sanders', 'The queen of tarts.', 'Sandi, a 28-year-old intelligence researcher is American. She started college but never finished the course. She is obsessed with zombies.

Physically, Sandi is in pretty good shape. She is average-height with fair skin, golden hair and green eyes. She has a tattoo of a brain between her shoulder blades.

She grew up in a working class neighbourhood. Her mother left when she was young, leaving her with her father, who was a drunk.

She is currently in a relationship with Sandy Sanders. Sandy is the same age as her and works as a builder.

Her best friend is an intelligence researcher called Vienna Rogers. They get on well most of the time. She also hangs around with Kaiden Park and Nevaeh Ingram. They enjoy social card games together.

Her favorite things in life are travelling and eating.');



CREATE TABLE posts (
  post_id SERIAL PRIMARY KEY,
  author_id int,
  tags text [],
  headline varchar(255),
  heroimage varchar(255),
  publishdate date,
  slug varchar(255),
  type varchar(100),
  history text
);

INSERT INTO posts (author_id, tags, headline, heroimage, publishdate, slug, type, history)
VALUES (
  2,
  ARRAY ['20th Century', 'Modern', 'Dessert', 'Depression Era', 'Recipes'],
  'Depression Cake',
  './assets/posts/chocolate_cake.jpeg',
  '2022-05-19',
  'Depression cake has been referred to as "War Cake" by texts dating back to World War I. In a pamphlet distributed by the United States Food Administration in 1918 entitled "War Economy in Food", War Cake is listed under "Recipes for Conservation Sweets". ',
  'Recipes',
  '<div class="mb-5 col-sm-12"><p>Depression cake&nbsp;is a type of&nbsp;cake&nbsp;that was commonly made during the&nbsp;Great Depression. The&nbsp;ingredients&nbsp;include little or no&nbsp;milk,&nbsp;sugar,&nbsp;butter, or&nbsp;eggs, because the ingredients were then either expensive or hard to obtain. Similar cakes are known as "War Cake", as they avoided ingredients that were scarce or were being conserved for the use of soldiers. A common depression cake is also known as "Boiled Raisin Cake", "Milkless, Eggless, Butterless Cake", or "Poor Man''s Cake".[1]&nbsp;"Boiled" refers to the boiling of raisins with the sugar and spices to make a syrup base early in the recipe. However, some bakers do include butter. Boiled raisin-type cakes date back at least to the&nbsp;American Civil War.
The United States Food Administration stressed the importance of reducing sugar consumption during the war and offered molasses, corn syrup, and raisins in its place.
</p><img src="./assets/posts/simple_chocolate_cake.jpg" alt="chocolate cake" class="richttext-img" style="justify-self: center;"><p>When the&nbsp;Great Depression&nbsp;hit America following the Stock Market Crash of 1929, families were forced to stretch their budgets and "make do" with minimal and cheap ingredients when it came to cooking. Some women were able to feed their families on $5 per week.&nbsp;Dessert became a luxury for most, and depression cake was a more affordable alternative to other cakes that used milk, eggs, and butter. Affordability was achieved through ingredient substitution. For example, shortening was substituted for butter, water was substituted for milk, and baking powder was substituted for eggs.&nbsp;Depression cake is just one of many examples of ingredient substitution during the Great Depression, as some women took full advantage of the practice by making mock foods such as mock&nbsp;apple pie&nbsp;and mock fish.
Radio shows and women''s periodicals played a large role in circulating the recipe for depression cake during the Great Depression.&nbsp;The Betty Crocker Cooking Hour was one such show that provided women with budget-friendly recipes.&nbsp;General Mills, owner of Betty Crocker, employed nutritionists and cooks to experiment with different ways of "ruining" a cake, such as ingredient omission.&nbsp;Loring Schuler''s Journal was a publication that also offered baking tips during the Great Depression, recommending replacing eggs with baking powder and using inexpensive grains and produce.&nbsp;A recipe titled "War Cake" was published in&nbsp;M.F.K. Fisher''s book&nbsp;How to Cook a Wolf&nbsp;and republished in her&nbsp;The Art of Eating; it uses&nbsp;bacon&nbsp;grease on the premise that&nbsp;spices&nbsp;will mask its taste.
</p><img src=".assets/posts/migrant_mother.jpeg" alt="migrant mother" class="richttext-img" style="justify-self: center;"><p></p><img src="./assets/posts/breadline.jpeg" alt="breadline" class="richttext-img" style="justify-self: center;"><p>For further Reading:</p><p><a href="https://newengland.com/today/food/desserts/cakes-frostings/poor-mans-cake/">Poor Man''s Cake - New England Today</a></p><p><a href="http://www.cooks.com/rec/view/0,176,156185-242204,00.html">Cooks.com - Recipe - Depression Cake</a></p><p>In Modern Times:</p><p>Praised for its practicality and declared to be "the most worthwhile cake ever made," depression cake is still baked in modern America.&nbsp;The recipe for it has been featured in an array of publications such as&nbsp;<a href="https://en.wikipedia.org/wiki/The_Telegraph-Herald"><i>The Telegraph-Herald</i></a>,&nbsp;<a href="https://en.wikipedia.org/wiki/The_Pittsburgh_Press"><i>The Pittsburgh Press</i></a>, and&nbsp;<a href="https://en.wikipedia.org/wiki/The_Modesto_Bee"><i>The Modesto Bee</i></a></p></div>');