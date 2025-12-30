USE TheSixthString;
SET FOREIGN_KEY_CHECKS=0;
SET UNIQUE_CHECKS=0;
SET SQL_SAFE_UPDATES=0;

-- Force insert ALLES (negeert FK errors)
INSERT IGNORE INTO Klant ...
INSERT IGNORE INTO Categorie ...
INSERT IGNORE INTO Product ...
INSERT IGNORE INTO Bestelling ...
INSERT IGNORE INTO Bestelregel ...
-- Klanten
INSERT INTO Klant (voornaam, achternaam, email, telefoon, straat, postcode, huisnummer, toevoeging, plaats, wachtwoord_hash, account_status) VALUES
('Kenneth', 'Busser', 'kenneth@windesheim.nl', '0612345678', 'Campus', '1234AB', 2, '', 'Zwolle', 'hash', 'actief'),
('Joris', 'Weber', 'joris@windesheim.nl', '0612345678', 'Campus', '1234AB', 3, 'A', 'Amersfoort', 'hash', 'actief'),
('Mustafa', 'Al Tamimi', 'mustafa@windesheim.nl', '0612345678', 'Campus', '1234AB', 4, 'C', 'Amsterdam', 'hash', 'actief'),
('Frank', 'Otten', 'frank@windesheim.nl', '0612345678', 'Campus', '1234AB', 5, 'H', 'Rotterdam', 'hash', 'actief'),
('Mark', 'de Vries', 'mark@windesheim.nl', '0612345678', 'Campus', '1234AB', 6, '', 'Den Haag', 'hash', 'actief');

-- Categorieën
INSERT INTO Categorie (naam) VALUES
('elektrische gitaren'),
('semi akoestische gitaar'),
('kindergitaar'),
('Accessoires'),
('Reisgitaar');

-- Producten
INSERT INTO Product (naam, merk, beschrijving, prijs, stock_quantity, afbeelding_url, video_url, categorie_id) VALUES
('Fazley Classic Series FST118 Sunburst elektrische gitaar', 'Fazley', 'Dit is een mooie Fazley gitaar', 79.00, 5, 'https://static.bax-shop.nl/image/product/202072/571972/2f16c216/450x450/1456908615Fazley_FST%20100%20SB_front.jpg', 'https://www.youtube.com/watch?v=Lvfh9biQ0gA&pp=ygU4RmF6bGV5IENsYXNzaWMgU2VyaWVzIEZTVDExOCBTdW5idXJzdCBlbGVrdHJpc2NoZSBnaXRhYXI%3D', 1),
('Aria Pro II Hot Rod Collection 718-MK2 Brooklyn Open Pore Black elektrische gitaar met aluminium slagplaat', 'Aria', 'Dit is een mooie Aria gitaar', 478.00, 3, 'https://static.bax-shop.nl/image/product/1230004/4960516/d2b8faa4/450x450/1707458109718mk2_opbk_product_1800x1800-1.jpg', 'https://www.youtube.com/watch?v=H5L7mKR8YfU&pp=ygVqQXJpYSBQcm8gSUkgSG90IFJvZCBDb2xsZWN0aW9uIDcxOC1NSzIgQnJvb2tseW4gT3BlbiBQb3JlIEJsYWNrIGVsZWt0cmlzY2hlIGdpdGFhciBtZXQgYWx1bWluaXVtIHNsYWdwbGFhdA%3D%3D', 1),
('LaPaz C50N klassieke gitaar naturel', 'LaPaz', 'Dit is een mooie LaPaz gitaar', 249.00, 1, 'https://static.bax-shop.nl/image/product/195246/663912/625d9d6e/450x450/1464165434lapaz%20c50n%20front.jpg', 'https://www.youtube.com/watch?v=QuL6EpHv1qE&pp=ygUjTGFQYXogQzUwTiBrbGFzc2lla2UgZ2l0YWFyIG5hdHVyZWw%3D', 2),
('Angel Lopez EC3000CN', 'Angel Lopez', 'Dit is een mooie Angel Lopez gitaar', 324.00, 2, 'https://static.bax-shop.nl/image/product/122035/235429/f0ad43e4/450x450/Stagg_EC3000CN_Angel_Lopez_front.jpg', 'https://www.youtube.com/watch?v=ra1VEf2PwmI&list=RDra1VEf2PwmI&start_radio=1&pp=ygUUQW5nZWwgTG9wZXogRUMzMDAwQ06gBwE%3D', 2),
('Cascha CGC200-3/4 Stage Series klassieke gitaar 3/4 naturel + gigbag', 'Cascha', 'Dit is een mooie Cascha kinder gitaar met tas', 208.00, 10, 'https://static.bax-shop.nl/image/product/1115098/4316229/0f0ad0cc/450x450/1683648375CGC200-00-Main.jpg', 'https://www.youtube.com/shorts/r7iW4ZunjRo', 3),
('Cascha HH 2354 Student Series klassieke gitaar 1/2 + gigbag + plectrums', 'Cascha', 'Dit is een 2e mooie Cascha kinder gitaar met tas', 98.00, 15, 'https://static.bax-shop.nl/image/product/1115131/4316423/44b8dcc5/450x450/1683660516HH-2354-01.jpg', 'https://www.youtube.com/watch?v=ChuSBdyNgbQ&pp=ygVHQ2FzY2hhIEhIIDIzNTQgU3R1ZGVudCBTZXJpZXMga2xhc3NpZWtlIGdpdGFhciAxLzIgKyBnaWdiYWcgKyBwbGVjdHJ1bXM%3D', 3),
('Ernie Ball Classic Jacquard Strap 5438 Daisy After Dark gitaarband', 'Ernie Ball', 'Dit is een gitaarband', 29.00, 50, 'https://static.bax-shop.nl/image/product/1475070/6084392/862836ad/450x450/1763653551000002.jpg', '', 4),
('Innox IGS 07 elektrische gitaar standaard', 'Innox', 'Dit is een Innox gitaarstand', 12.70, 32, 'https://static.bax-shop.nl/image/product/169618/364132/ad462bf4/450x450/INNOX_IGS_07_FRONT_RIGHT.jpg', '', 4),
('Fazley W55-COL-BR-3/4 ColourTune western gitaar bruin', 'Fazley', 'Dit is een mooie Fazley reisgitaar', 61.00, 1, 'https://static.bax-shop.nl/image/product/681530/2704927/47684953/450x450/1614088634_MG_7981.jpg', 'https://www.youtube.com/watch?v=1vCF762Ny5o&pp=ygU1RmF6bGV5IFc1NS1DT0wtQlItMy80IENvbG91clR1bmUgd2VzdGVybiBnaXRhYXIgYnJ1aW7SBwkJTQoBhyohjO8%3D', 5),
('LaPaz 002 PI 3/4 klassieke gitaar roze', 'LaPaz', 'Dit is een mooie roze LaPaz reisgitaar', 59.00, 2, 'https://static.bax-shop.nl/image/product/553225/2924338/65a20eac/450x450/16232156551582289141LaPaz%20002%20PI%203-4_5.jpg', 'https://www.youtube.com/watch?v=R08XosaH9A0&pp=ygUmTGFQYXogMDAyIFBJIDMvNCBrbGFzc2lla2UgZ2l0YWFyIHJvemU%3D', 5);

-- Bestelling (klant_id 3 = Mustafa)
INSERT INTO Bestelling (klant_id, besteldatum, status, totaalbedrag) VALUES
(3, '2025-12-29 00:00:00', 'nog niet betaald', 250.00);

-- Bestelregel (bestelling_id 1, product_id 1 = Fazley gitaar)
INSERT INTO Bestelregel (bestelling_id, product_id, aantal, prijs_per_stuk) VALUES
(1, 1, 3, 45.99);
