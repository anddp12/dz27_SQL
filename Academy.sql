DROP TABLE IF EXISTS "Преподаватели (Teachers)";

CREATE TABLE "Преподаватели (Teachers)" (
	"ID"	INTEGER NOT NULL UNIQUE,
	"Имя"	TEXT NOT NULL,
	"Фамилия"	TEXT NOT NULL,
	"Должность (Position)"	TEXT NOT NULL,
	"ЗП"	REAL NOT NULL,
	"Дата приема на работу"	TEXT NOT NULL,
	"Надбавка (Premium)"	REAL NOT NULL DEFAULT 0,
	"Ассистент (IsAssistant)"	INTEGER NOT NULL DEFAULT 0,
	"Профессор (IsProfessor)"	INTEGER NOT NULL DEFAULT 0,
	PRIMARY KEY("ID" AUTOINCREMENT)
);

INSERT INTO "Преподаватели (Teachers)" VALUES (71, "Денис", "Бойко", "Старший преподаватель", 9500, "2013-08-23", 0, 0, 0);
INSERT INTO "Преподаватели (Teachers)" VALUES (12, "Игорь", "Варцаба", "Ассистент", 8000, "2020-09-14", 0, 1, 0);
INSERT INTO "Преподаватели (Teachers)" VALUES (2, "Александр", "Сваток", "Ассистент", 8000, "2013-03-18", 0, 0, 0);
INSERT INTO "Преподаватели (Teachers)" VALUES (6, "Дмитрий", "Чигринский", "Доцент", 11500, "2011-05-28", 0, 0, 0);
INSERT INTO "Преподаватели (Teachers)" VALUES (3, "Евгений", "Чеберячко", "Доцент", 11500, "2012-09-11", 0, 0, 0);
INSERT INTO "Преподаватели (Teachers)" VALUES (4, "Артем", "Федецкий", "Профессор", 13500, "2010-07-21", 0, 0, 1);
INSERT INTO "Преподаватели (Teachers)" VALUES (18, "Роман", "Зозуля", "Профессор", 13500, "2010-03-07", 0, 0, 1);
INSERT INTO "Преподаватели (Teachers)" VALUES (25, "Евгений", "Шахов", "Ассистент", 8000, "2020-05-16", 0, 1, 0);
INSERT INTO "Преподаватели (Teachers)" VALUES (10, "Евгений", "Коноплянка", "Старший преподаватель", 9500, "2011-02-19", 0, 0, 0);
INSERT INTO "Преподаватели (Teachers)" VALUES (19, "Роман", "Безус", "Старший преподаватель", 9500, "2013-10-15", 0, 0, 0);
INSERT INTO "Преподаватели (Teachers)" VALUES (11, "Евгений", "Селезнев", "Профессор", 13500, "2012-11-02", 0, 0, 1);
INSERT INTO "Преподаватели (Teachers)" VALUES (9, "Николай", "Калинич", "Доцент", 11500, "2014-07-11", 0, 0, 0);


DROP TABLE IF EXISTS "Факультеты (Faculties)";

CREATE TABLE "Факультеты (Faculties)" (
	"ID"	INTEGER NOT NULL UNIQUE,
	"Название факультета"	TEXT NOT NULL UNIQUE,
	"Декан факультета"	TEXT NOT NULL,
	PRIMARY KEY("ID" AUTOINCREMENT)
);

INSERT INTO "Факультеты (Faculties)" VALUES (1, "Архитектурный", "Мирон Маркевич");
INSERT INTO "Факультеты (Faculties)" VALUES (2, "Информационных технологий", "Александр Петраков");
INSERT INTO "Факультеты (Faculties)" VALUES (3, "Строительный", "Виктор Скрипник");


DROP TABLE IF EXISTS "Кафедры (Departments)";

CREATE TABLE "Кафедры (Departments)" (
	"ID"	INTEGER NOT NULL UNIQUE,
	"Название кафедры"	TEXT NOT NULL UNIQUE,
	"Финансирование (Financing)"	REAL NOT NULL DEFAULT 0,
	PRIMARY KEY("ID" AUTOINCREMENT)
);

INSERT INTO "Кафедры (Departments)" VALUES (1, "Архитектуры", 31000);
INSERT INTO "Кафедры (Departments)" VALUES (2, "Архитектурного проектирования", 21000);
INSERT INTO "Кафедры (Departments)" VALUES (3, "Автоматизации", 21500);
INSERT INTO "Кафедры (Departments)" VALUES (4, "Компьютерных наук", 19500);
INSERT INTO "Кафедры (Departments)" VALUES (5, "Организации управления", 23000);
INSERT INTO "Кафедры (Departments)" VALUES (6, "Инженерный", 11500);


DROP TABLE IF EXISTS "Группы (Groups)";

CREATE TABLE "Группы (Groups)" (
	"ID"	INTEGER NOT NULL UNIQUE,
	"Название группы"	TEXT NOT NULL UNIQUE,
	"Курс (Year)"	INTEGER NOT NULL,
	"Рейтинг группы"	INTEGER NOT NULL,
	PRIMARY KEY("ID" AUTOINCREMENT)
);

INSERT INTO "Группы (Groups)" VALUES (1, "Архитектуры5", 5, 1);
INSERT INTO "Группы (Groups)" VALUES (2, "Инженерный5", 5, 5);
INSERT INTO "Группы (Groups)" VALUES (3, "Компьютерных наук4", 4, 2);
INSERT INTO "Группы (Groups)" VALUES (4, "Организации управления4", 4, 4);
INSERT INTO "Группы (Groups)" VALUES (5, "Инженерный4", 4, 3);
INSERT INTO "Группы (Groups)" VALUES (6, "Компьютерных наук3", 3, 0);
INSERT INTO "Группы (Groups)" VALUES (7, "Инженерный2", 2, 0);
INSERT INTO "Группы (Groups)" VALUES (8, "Автоматизации2", 2, 0);
INSERT INTO "Группы (Groups)" VALUES (9, "Инженерный1", 1,0);
INSERT INTO "Группы (Groups)" VALUES (10, "Архитектурного проектирования1", 1, 0);


-- 1. Вывести таблицу кафедр, но расположить ее поля в обратном порядке. 
SELECT * FROM "Кафедры (Departments)" 
ORDER BY ID DESC;

SELECT * FROM "Кафедры (Departments)" 
ORDER BY "Название кафедры"; -- сортировка по названию

-- 2. Вывести названия групп и их рейтинги с уточнением имен полей именем таблицы.
SELECT "Название группы", "Рейтинг группы" 
FROM "Группы (Groups)";

SELECT * FROM "Группы (Groups)" 
ORDER BY "Рейтинг группы"; -- сортировка по рейтингу от большего к меньшему 

SELECT * FROM "Группы (Groups)" 
ORDER BY "Рейтинг группы" DESC LIMIT 3; -- первые 3 

-- 5. Вывести фамилии преподавателей, которые являются профессорами и ставка которых превышает 1050.
SELECT * FROM "Преподаватели (Teachers)" 
WHERE "ЗП" >1050 AND "Профессор (IsProfessor)" == 1;

-- 6. Вывести названия кафедр, фонд финансирования от 11600 до 25000.
SELECT * FROM "Кафедры (Departments)" 
WHERE "Финансирование (Financing)" >= 11600 and "Финансирование (Financing)" <=25000 
ORDER BY "Финансирование (Financing)";

-- 7. Вывести названия факультетов кроме факультета “Информационных технологий”
SELECT * FROM "Факультеты (Faculties)" 
WHERE "Название факультета" != "Информационных технологий"; 