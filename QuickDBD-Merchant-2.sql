-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/TAj8X8
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Card_holder" (
    "id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_Card_holder" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Credit_card" (
    "card" VARCHAR(20)   NOT NULL,
    "cardholder_id" INT   NOT NULL
);

CREATE TABLE "Merchant" (
    "id" INT   NOT NULL,
    "name" VARCHAR(255)   NOT NULL,
    "id_merchant_category" INT   NOT NULL,
    CONSTRAINT "pk_Merchant" PRIMARY KEY (
        "id","id_merchant_category"
     )
);

CREATE TABLE "Merchant_category" (
    "id" INT   NOT NULL,
    "Name" VARCHAR(255)   NOT NULL
);

CREATE TABLE "Transaction" (
    "id" INT   NOT NULL,
    "date" TIMESTAMP   NOT NULL,
    "amount" FLOAT   NOT NULL,
    "card" VARCHAR(20)   NOT NULL,
    "id_merchant" INT   NOT NULL
);

ALTER TABLE "Credit_card" ADD CONSTRAINT "fk_Credit_card_cardholder_id" FOREIGN KEY("cardholder_id")
REFERENCES "Card_holder" ("id");

ALTER TABLE "Merchant_category" ADD CONSTRAINT "fk_Merchant_category_id" FOREIGN KEY("id")
REFERENCES "Merchant" ("id_merchant_category");

ALTER TABLE "Transaction" ADD CONSTRAINT "fk_Transaction_id_merchant" FOREIGN KEY("id_merchant")
REFERENCES "Merchant" ("id");

