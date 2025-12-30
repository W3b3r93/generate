USE TheSixthString;

-- Welkom01! hash voor ALLE klanten
UPDATE Klant SET wachtwoord_hash = '$2y$10$8G0gK1y7z9vW3xQ4rT5uP.6mN7oP8qR9sT0uV1wX2yZ3aB4cD5eF6' WHERE email LIKE '%windesheim.nl';

-- Check
SELECT email, LEFT(wachtwoord_hash, 30) as hash_preview, account_status FROM Klant;
