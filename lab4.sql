SELECT u.name
FROM USER u
    JOIN EATS e USING (name)
WHERE u.gender = 'female' AND (e.pizza = 'mushroom' OR e.pizza = 'pepperoni');