-- 1. collars with know owners
SELECT lost_dog_collars.id AS collar_id, dog_owners.name
  FROM dog_owners
  JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name);

-- 2. collars without known owners
SELECT lost_dog_collars.id AS collar_id, dog_owners.name
  FROM dog_owners
  RIGHT JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name)
  WHERE dog_owners.name IS NULL;

-- 3. collars in possesion
SELECT lost_dog_collars.id AS collar_id, lost_dog_collars.dog_name AS dog_name, dog_owners.name AS dog_owners
  FROM dog_owners
  RIGHT JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name) ORDER BY dog_owners.name, lost_dog_collars.id;

-- 4. owners and if a collar matches
SELECT dog_owners.name AS dog_owners, lost_dog_collars.id AS collar_id, lost_dog_collars.dog_name AS dog_name
  FROM dog_owners
  INNER JOIN lost_dog_collars
  ON (dog_owners.dog_name = lost_dog_collars.dog_name) ORDER BY dog_owners.name;
