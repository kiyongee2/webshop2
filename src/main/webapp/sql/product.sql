
CREATE TABLE product(
	p_id VARCHAR(10) PRIMARY KEY,
	p_name VARCHAR(20),
	p_unitPrice INTEGER,
	p_description TEXT,
	p_category VARCHAR(20),
	p_manufacturer VARCHAR(20),
	p_unitsInStock LONG,
	p_condition VARCHAR(20),
	p_productImage VARCHAR(20)
);

INSERT INTO product VALUES ('P1234', 'iPhone 6s', 800000, '4.7-inch 1334X750 Renia 
	HD display 8-magapixel iSight Camera', 'Smart Phone', 'Apple', 1000, 'New', 'P1234.png');
INSERT INTO product VALUES ('P1235', 'LG PC gram', 1500000, '3.3-inch, IPS LED display 
	5rd Generation Intel Core processors', 'Notebook', 'LG', 1000, 'new', 'P1235.png');
INSERT INTO product VALUES ('P1236', 'Galaxy Tab S', 900000, '3.3-inch, 212.8*125.6*6.6mm,
    Super AMOLED display, Octa-Core processor', 'Tablet', 'Samsung', 1000, 'new', 'P1236.png');

SELECT * FROM product;
	
	