-- Create Authors Table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY, 
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_year INT
);

-- Create Categories Table
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

-- Create Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author_id INT,
    category_id INT,
    published_year INT,
    ISBN VARCHAR(13) UNIQUE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

-- Create Members Table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    membership_date DATE
);

-- Create Loans Table (Many-to-Many relationship between Members and Books)
CREATE TABLE Loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT,
    member_id INT,
    loan_date DATE,
    return_date DATE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (member_id) REFERENCES Members(member_id)
);

-- Inserting Authors
INSERT INTO Authors (first_name, last_name, birth_year) 
VALUES ('J.K.', 'Rowling', 1965),
       ('George', 'Orwell', 1903);

-- Inserting Categories
INSERT INTO Categories (category_name)
VALUES ('Fantasy'),
       ('Dystopian');

-- Inserting Books
INSERT INTO Books (title, author_id, category_id, published_year, ISBN) 
VALUES ('Harry Potter and the Sorcerer\'s Stone', 1, 1, 1997, '9780747532743'),
       ('1984', 2, 2, 1949, '9780451524935');

-- Inserting Members
INSERT INTO Members (first_name, last_name, membership_date) 
VALUES ('John', 'Doe', '2025-05-13'),
       ('Jane', 'Smith', '2025-05-14');

-- Inserting Loans
INSERT INTO Loans (book_id, member_id, loan_date, return_date) 
VALUES (1, 1, '2025-05-13', '2025-06-13'),
       (2, 2, '2025-05-14', '2025-06-14');
