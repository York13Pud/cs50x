-- SQLite
-- id, symbol, name, shares, price, user_id, timestamp
CREATE TABLE transactions (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
    symbol TEXT NOT NULL,
    name TEXT NOT NULL,
    shares INT NOT NULL,
    price NUMERIC NOT NULL,
    user_id REFERENCES users(id),
    timestamp DATE DEFAULT CURRENT_TIMESTAMP
)