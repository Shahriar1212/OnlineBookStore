clear screen;

--delete existing table
DROP TABLE Book CASCADE CONSTRAINTS;
DROP TABLE Users CASCADE CONSTRAINTS;
DROP TABLE Orders CASCADE CONSTRAINTS;

CREATE TABLE BOOK
(
    BookID number,
    BookName varchar(500),
    Author varchar(100),
    Lang varchar(50),
    Price number,
    Quantity number,
        PRIMARY KEY(BookID)
);

CREATE TABLE Users
(
    UserID number,
    UserName varchar(100),
    Email varchar(100),
    Password varchar(100),
        PRIMARY KEY(UserID)
);

CREATE TABLE Orders
(
    OrderID number,
    UserID number,
    BookID number,
        PRIMARY KEY(OrderID)
);

INSERT INTO Book VALUES(25, 'Berlin Alexanderplatz', 'Alfred Dooblin', 'German', 320, 14);
INSERT INTO Book VALUES(26, 'The Metamorphosis', 'Franz Kafka', 'German', 320, 10);
INSERT INTO Book VALUES(27, 'The Tin Drum', 'Gunter Grass', 'German', 320, 10);
INSERT INTO Book VALUES(28, 'Buddenbrooks', 'Thomas Mann', 'German', 220, 10);
INSERT INTO Book VALUES(29, 'The Sorrows of Young Werther', 'Johann Wolfgang von Goethe', 'German', 340, 10);
INSERT INTO Book VALUES(30, 'The Magic Mountain', 'Thomas Mann', 'German', 150, 10);
INSERT INTO Book VALUES(31, 'Faust', 'Johann Wolfgang von Goethe', 'German', 199, 10);
INSERT INTO Book VALUES(32, 'Steppenwolf', 'Hermann Hesse', 'German', 390, 10);
INSERT INTO Book VALUES(33, 'The Glass Bead Game', 'Hermann Hesse', 'German', 249, 10);
INSERT INTO Book VALUES(34, 'Der Richter und sein Henker', 'Friedrich Durrenmatt', 'German',36, 10);
INSERT INTO Book VALUES(35, 'Das siebte Kreuz', 'Anna Seghers', 'German', 450, 10);
INSERT INTO Book VALUES(36, 'Der Tod in Venedig', 'Thomas Mann', 'German', 320, 10);
INSERT INTO Book VALUES(37, 'Siddhartha', 'Hermann Hesse', 'German', 120, 10);
INSERT INTO Book VALUES(38, 'Effi Briest', 'Theodor Fontane', 'German', 250, 10);
INSERT INTO Book VALUES(39, 'Berlin Alexanderplatz', 'Alfred Dooblin', 'German',190, 10);
INSERT INTO Book VALUES(40, 'Inkheart', 'Cornelia Funke', 'German', 160, 10);
INSERT INTO Book VALUES(41, 'Auto-da-Fe', 'Elias Canetti', 'German', 200, 10);
INSERT INTO Book VALUES(42, 'Mephisto', 'Klaus Mann', 'German', 300, 10);
INSERT INTO Book VALUES(43, 'Babylon Berlin', 'Volker Kutscher', 'German', 250, 10);
INSERT INTO Book VALUES(44, 'Visitation', 'Jenny Erpenbeck', 'German', 255, 10);
INSERT INTO Book VALUES(45, 'The Tin Drum', 'Guunter Grass', 'German', 160, 10);
INSERT INTO Book VALUES(46, 'Malina', 'Ingeborg Bachmann', 'German', 150, 10);
INSERT INTO Book VALUES(47, 'The Nazi and the Barber', 'Edgar Hilsenrath', 'German', 190, 10);
INSERT INTO Book VALUES(48, 'Kruso', 'Lutz Seiler', 'German', 200, 10);
INSERT INTO Book VALUES(49, 'Hooligan', 'Philipp Winkler', 'German', 320, 10);



-- INSERT INTO Book VALUES(16, 'বি দ্য ব্রান্ড', 'জুলস মার্কোক্স', 'Bangla', 10);
-- INSERT INTO Book VALUES(17, 'দাস পার্টির খোঁজে', 'হাসান মোরশেদ', 'Bangla', 10);
-- INSERT INTO Book VALUES(18, 'বাংলাদেশের বীরগাথা', 'মোঃ দেলোয়ার হোসেন', 'Bangla', 10);
-- INSERT INTO Book VALUES(19, 'মুক্তিযুদ্ধে কাদেরিয়া বাহিনীর জনযুদ্ধ', 'কাদের সিদ্দিকী বীর উত্তম', 'Bangla', 10);
-- INSERT INTO Book VALUES(20, 'সাত বীরশ্রেষ্ঠ ও বাংলাদেশের মুক্তিযুদ্ধ', 'জীবনী সংকলন', 'Bangla', 10);
-- INSERT INTO Book VALUES(21, 'মু্ক্তিযুদ্ধের ১৬ জন সেক্টর কমান্ডার', 'সাহাদত হোসেন খান', 'Bangla', 10);
-- INSERT INTO Book VALUES(22, 'অনুভূতির অভিধান', 'তাহসান খান', 'Bangla', 10);
-- INSERT INTO Book VALUES(23, 'আনলক ইট', 'ড্যান লক', 'Bangla', 10);
-- INSERT INTO Book VALUES(24, 'জবাব', 'আরিফ আজাদ', 'Bangla', 10);
-- INSERT INTO Book VALUES(25, 'অলৌকিক ১৩', 'রাসেল', 'Bangla', 10);
-- INSERT INTO Book VALUES(26, 'টিউশনি', 'কয়েস সামী', 'Bangla', 10);
-- INSERT INTO Book VALUES(27, 'ইনসাইড ইসলাম', 'আব্দুল হাই মুহাম্মদ সাইফুল্লাহ', 'Bangla', 10);
-- INSERT INTO Book VALUES(28, 'জলপরানি', 'কিঙ্কর আহ্‌সান', '', 10);
-- INSERT INTO Book VALUES(29, 'পার্সোনাল ব্র্যান্ডিং', 'মো. তাজদীন হাসান', 'Bangla', 10);
-- INSERT INTO Book VALUES(30, 'মায়াবতী কন্যা', 'শারমিন আঁচল নিপা', 'Bangla', 10);
-- INSERT INTO Book VALUES(31, 'গহিরা', 'জিব্রান', 'Bangla', 10);
-- INSERT INTO Book VALUES(32, 'মার্কেটিংনামা', 'নূর-আল-আহাদ', 'Bangla', 10);
-- INSERT INTO Book VALUES(33, 'নলিনী', 'শুভ', '', 10);
-- INSERT INTO Book VALUES(34, 'মানুষছবি', 'নিশো আল মামুন', 'Bangla', 10);
-- INSERT INTO Book VALUES(35, 'টাইম মেশিন', ' মোঃ সোহান হায়দার', 'Bangla', 10);
-- INSERT INTO Book VALUES(36, 'লোথিয়ান দ্বীপের রহস্য', 'শাহনেওয়াজ জয়', 'Bangla', 10);

INSERT INTO Users VALUES(5, 'moin', 'moin@gmai.com', '12345');
INSERT INTO Users VALUES(6, 'hasan', 'hasan@gmail.com', '12345');
INSERT INTO Users VALUES(7, 'jack', 'jack@gmail.com', '12345');

commit;


