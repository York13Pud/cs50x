-- Create transactions table:
CREATE TABLE transactions (
    id          INTEGER     NOT NULL PRIMARY KEY AUTOINCREMENT, 
    symbol      TEXT        NOT NULL,
    type        TEXT        NOT NULL,
    name        TEXT        NOT NULL,
    shares      INTEGER     NOT NULL,
    price       NUMERIC     NOT NULL,
    user_id     INTEGER     NOT NULL REFERENCES users(id),
    timestamp   DATE        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT type_is_buy_sell 
        CHECK (type='buy' OR type='sell')
);