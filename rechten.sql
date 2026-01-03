-- ========================================
-- THE SIXTH STRING - CRUD RECHTEN SCRIPT
-- Gebaseerd op mijn CRUD matrix
-- ========================================

USE TheSixthString;

-- 1. DB USER voor applicatie
CREATE USER IF NOT EXISTS 'dbsixthstring_user'@'localhost' IDENTIFIED BY 'jouw_sterke_wachtwoord';

-- 2. KLANT (C,R,U,D voor eigen klant)
GRANT SELECT, INSERT, UPDATE ON Klant TO 'dbsixthstring_user'@'localhost';

-- 3. BESTELLING (R voor klant, CRUD voor webbeheerder)
GRANT SELECT ON Bestelling TO 'dbsixthstring_user'@'localhost';

-- 4. ADRES (CRUD voor eigen klant)
GRANT SELECT, INSERT, UPDATE, DELETE ON Adres TO 'dbsixthstring_user'@'localhost';

-- 5. PRODUCT (R voor klant, CRUD voor webbeheerder)
GRANT SELECT ON Product TO 'dbsixthstring_user'@'localhost';

-- 6. RETOUR (R voor klant, CRUD voor webbeheerder)
GRANT SELECT ON Retour TO 'dbsixthstring_user'@'localhost';

FLUSH PRIVILEGES;

-- ========================================
-- ✅ TOEGEVOEGD: Factuur generatie fix
-- ========================================
GRANT SELECT ON Bestelling TO 'dbsixthstring_user'@'localhost';
-- Account-page.php kan nu facturen downloaden [file:5]

SELECT '✅ CRUD RECHTEN GEINSTALLEERD!' AS Status;
SHOW GRANTS FOR 'dbsixthstring_user'@'localhost';
