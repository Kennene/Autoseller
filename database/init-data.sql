INSERT INTO items (name, price) VALUES ('Stół z powyłamywanymi nogami', 21.37);

INSERT INTO items (name, amount, photo, price, description) 
VALUES (
    'Butelka nieoetykietowana',
    99,
    decode('89504e470d0a1a0a', 'hex'),
    19.99,
    'Butelka nieetykietowana jest prostym, ale zarazem eleganckim przedmiotem codziennego użytku. Jej szklana powierzchnia jest gładka i przejrzysta, ukazując zawartość w środku. Brak etykiety nadaje jej minimalistyczny charakter, pozbawiony zbędnych ozdobników i informacji. W dotyku jest chłodna i solidna, dając poczucie trwałości. Światło przenikające przez szkło tworzy ciekawe refleksy, dodając jej nieco tajemniczości. Może być wykorzystywana do przechowywania różnych płynów, od wody, przez soki, aż po domowej roboty nalewki. Jej uniwersalność sprawia, że pasuje do każdej kuchni czy stołu, niezależnie od stylu wnętrza. Brak etykiety wymusza na użytkowniku bliższe przyjrzenie się zawartości, co może prowadzić do ciekawych odkryć smakowych. Jest symbolem prostoty i funkcjonalności, nie narzucając żadnych marek ani treści. Taka butelka to czysta forma, która doskonale łączy praktyczność z estetyką.'
);

INSERT INTO users (login, password_hash) VALUES ('jondoe', crypt('y.5&w;F7CRMaz5XV', gen_salt('bf')));
INSERT INTO users (login, fullname, password_hash)
VALUES (
    'jankowalski',
    'Jan Kowalski',
    crypt('ZDK%,@9v.9Hg9NwX', gen_salt('bf'))
);
-- SELECT * FROM users WHERE login = 'jankowalski' AND password_hash = crypt('ZDK%,@9v.9Hg9NwX', password_hash);