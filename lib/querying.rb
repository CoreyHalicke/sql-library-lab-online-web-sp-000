=begin
SELECT * FROM series;



SELECT * FROM subgenres;



SELECT * FROM authors;



SELECT * FROM books;



SELECT * FROM characters;



SELECT * FROM character_books;



=end

def select_books_titles_and_years_in_first_series_order_by_year
  "
  SELECT
  books.title, books.year
  FROM books
  WHERE books.series_id = 1;
  "
end

def select_name_and_motto_of_char_with_longest_motto
  "
  SELECT characters.name, characters.motto
  FROM characters
  ORDER BY LENGTH(characters.motto) DESC
  LIMIT 1;
  "
end


def select_value_and_count_of_most_prolific_species
  "
  SELECT characters.species, COUNT(characters.species) AS count
  FROM characters
  GROUP BY species
  ORDER BY count DESC
  LIMIT 1
  ;
  "
end

def select_name_and_series_subgenres_of_authors
  "
  SELECT authors.name, subgenres.name
  FROM authors
  INNER JOIN subgenres
  ON authors.id = subgenres.id
  ;
  "
end

def select_series_title_with_most_human_characters
  "
  SELECT s.title
  FROM authors a
  INNER JOIN characters c ON a.id = c.author_id
  INNER JOIN series s ON s.author_id = a.id
  WHERE c.species = 'human'
  GROUP BY s.title
  LIMIT 1
  ;

  "
end

def select_character_names_and_number_of_books_they_are_in
  "
  SELECT c.name, COUNT(c.name) AS books
  FROM characters c
  INNER JOIN character_books cb ON c.id = cb.character_id
  GROUP BY c.name
  ORDER BY books DESC
  ;
  "
end
