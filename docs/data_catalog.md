# Data Catalog

### TABLE: shows 

| Name         | DataType                | Description                                                 | NOTES                                    |
| ------------ | ----------------------- | ----------------------------------------------------------- | ---------------------------------------- |
| id           | INT                     | Surrogate key uniquely identifying each record in the table | **Primary Key**                          |
| type         | ENUM('Movie','TV Show') | The type of the show                                        |                   ----                   |
| title        | VARCHAR(150)            | The title of the show                                       | Using "Unknown" for missing/wrong values |
| date_added   | DATE                    | The date the show was added in Netflix                      | Using  NULL for missing/wrong values     |
| release_year | INT                     | The date the show was released                              | Using  NULL for missing/wrong values     |
| duration     | VARCHAR(50)             | The duration of the show                                    | Using "Unknown" for missing/wrong values |
| description  | TEXT                    | The description of the show                                 | Using "Unknown" for missing/wrong values |



### TABLE: directors 

| Name     | DataType                | Description                                                 | NOTES               |
| ---------| ----------------------- | ----------------------------------------------------------- | ------------------- |
| id       | INT                     | Surrogate key uniquely identifying each record in the table |  **Primary Key**    |
| name     | VARCHAR(150)            | The name of the director                                    |     ----            |


### TABLE: directors_shows 

| Name        | DataType                | Description                      | NOTES                                                   |
| ------------| ----------------------- | -------------------------------  | ------------------------------------------------------- |
| show_id     | INT                     | **Foreign key** to show(id)      | part of the **compound Primary Key**(show_id, director_id)  |
| director_id | INT                     | **Foreign key** to directors(id) | part of the **compound Primary Key**(show_id, director_id)  |


### TABLE: actors 

| Name   | DataType                | Description                                                 | NOTES               |
| ------ | ----------------------- | ----------------------------------------------------------- | ------------------- |
| id     | INT                     | Surrogate key uniquely identifying each record in the table | **Primary Key**     |
| name   | VARCHAR(150)            | The name of the actor                                       |         ----        |


### TABLE: actors_shows 

| Name         | DataType                | Description                      | NOTES                                                   |
| ------------ | ----------------------- | -------------------------------  | ------------------------------------------------------- |
| show_id      | INT                     | **Foreign key** to show(id)      | part of the **compound Primary Key**(show_id, actor_id)  |
| actor_id     | INT                     | **Foreign key** to actors(id)    | part of the **compound Primary Key**(show_id, actor_id)  |


### TABLE: countries 

| Name         | DataType                | Description                                                 | NOTES              |
| ------------ | ----------------------- | ----------------------------------------------------------- | ------------------ |
| id           | INT                     | Surrogate key uniquely identifying each record in the table | **Primary Key**    |
| name         | VARCHAR(150)            | The name of the country                                     |         ----       |


### TABLE: countries_shows 

| Name         | DataType                | Description                      | NOTES                                                     |
| ------------ | ----------------------- | -------------------------------  | --------------------------------------------------------- |
| show_id      | INT                     | **Foreign key** to show(id)      | part of the **compound Primary Key**(show_id, country_id) |
| country_id   | INT                     | **Foreign key** to countries(id) | part of the **compound Primary Key**(show_id, country_id) |



### TABLE: categories 

| Name         | DataType                | Description                                                 | NOTES              |
| ------------ | ----------------------- | ----------------------------------------------------------- | ------------------ |
| id           | INT                     | Surrogate key uniquely identifying each record in the table | **Primary Key**    |
| name         | VARCHAR(150)            | The name of the category                                    |    ----            |


### TABLE: categories_shows 

| Name         | DataType                | Description                      | NOTES                                                     |
| ------------ | ----------------------- | -------------------------------  | --------------------------------------------------------- |
| show_id      | INT                     | **Foreign key** to show(id)      | part of the **compound Primary Key**(show_id, category_id)|
| category_id  | INT                     | **Foreign key** to categories(id)| part of the **compound Primary Key**(show_id, category_id)|
