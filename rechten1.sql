-- ========================================
-- THE SIXTH STRING - RECHTEN FIX
-- Heeft config.php nodig
-- ========================================

USE TheSixthString;

-- APP USER (voor alle PHP pagina's)
CREATE USER IF NOT EXISTS 'dbsixthstring_user'@'localhost' 
IDENTIFIED BY 'SixthString2025!';

-- KLANT tabel: CRUD (wachtwoord fix!)
GRANT SELECT, INSERT, UPDATE, DELETE ON Klant TO 'dbsixthstring_user'@'localhost';

-- KLANTENSERVICE: CRUD (eigen tickets)
GRANT SELECT, INSERT, UPDATE, DELETE ON Klantenservice TO 'dbsixthstring_user'@'localhost';

-- ALLES ANDERS: Alleen lezen
GRANT SELECT ON Product TO 'dbsixthstring_user'@'localhost';
GRANT SELECT ON Categorie TO 'dbsixthstring_user'@'localhost';
GRANT SELECT ON Bestelling TO 'dbsixthstring_user'@'localhost';
GRANT SELECT ON Bestelregel TO 'dbsixthstring_user'@'localhost';
GRANT SELECT ON Betaling TO 'dbsixthstring_user'@'localhost';
GRANT SELECT ON Factuur TO 'dbsixthstring_user'@'localhost';
GRANT SELECT ON Retour TO 'dbsixthstring_user'@'localhost';
GRANT SELECT ON RetourRedenType TO 'dbsixthstring_user'@'localhost';
GRANT SELECT ON Afspraak TO 'dbsixthstring_user'@'localhost';

FLUSH PRIVILEGES;

SELECT '✅ RECHTEN INSTELLEN KLAAR!' AS Status;
SHOW GRANTS FOR 'dbsixthstring_user'@'localhost';
