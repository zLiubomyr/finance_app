**Персональний менеджер фінансів** - ПМФ – це інформаційна система, для контролю персональних фінансів 

Створення: 

rails g finance_app

Додати gem mysql2 to Gmfile - development



bundle



Створити базу даних,: 

MySQL

CREATE DATABASE fin_db;

CREATE USER 'fin_user'@'localhost' IDENTIFIED WITH mysql_native_password 'finpass';

GRANT  ALL ON fin_db. * TO 'fin_user'@'localhost' WITH GRANT OPTION

Редагувати файл конфігуацій database.yml

```ruby
development:

​	adapter: mysql
​	encoding: UTF8
​	database: fin_db
​	username: fin_user
​	password: finpass
​	host: localhost
​	port: 3306
```



1. Сутності:

   Генерація:

   rails g scaffold ...

- Category **name**:string **description**:string

  Перевірка:

```ruby
  has_many :operations

  paginates_per 1
  
  validates :name, uniqueness: true, length: 2..15
  validates :description, length: 5..25
```

- Operation **amount**:decimal **odate**:datetime **description**:string **category**:references

  Перевірка:

```ruby
  belongs_to :category

  paginates_per 1

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :odate, presence: true
  validates :description, length: 5..25
  validates :otype, presence: true
```

2. getBootstrap.com (CDN)

3. gem 'kaminari'

   Bundle

   rails g kaminari:views bootstrap4

   

   Controllers

   ```
   def index
     @operations = Operation.page(params[:page])
   end
   ```

Views

```
<%= paginate @operations %>
```

2. CRUD-операції

   

Послідовність створення:

1. Встановлення Ruby on Rails

2. Оновити Gem

3. Генерація методів

4. Генерація Контроллерів

5. Головна сторінка -контроллер -роут

6. Робота зі звітами **«Генератор звітів»**

   -контроллер  **Report** 

   -методи  **index**, **report_by_category **та **report_by_dates**



модуль, який відповідає за генерацію різного роду звітів з інформацією про витрати / доходи, наприклад:

Звіт по витратах в розрізі категорій (гістограма) 

Динаміка витрат по датах (ламана, сплайн)