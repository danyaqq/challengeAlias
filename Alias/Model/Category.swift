//
//  Category.swift
//  Alias
//
//  Created by Даня on 23.02.2022.
//

import Foundation

//по 60 слов на 4 категории (спорт, фильмы, животные, история)
struct Category{
    let name: String
    let words: [String]
    
    init(name: String, words: [String]) {
        self.name = name
        self.words = words
    }
}


var sport = Category(name: "Спорт", words: ["клюшка", "шайба", "гиря", "коньки", "штанга", "ворота", "конь", "козел", "трамплин", "болид", "татами", "ковер", "трико", "борцовки", "партер", "трек", "ринг", "гонг", "аут", "афсайт", "штрафной", "пенальти", "булит", "проброс", "фол", "гол", "булава", "тренер", "голкипер", "фанат", "болельщик", "бровка", "хоккей", "футбол", "гандбол", "бокс", "фехтование", "регби", "биатлон", "лыжи", "гетры", "баскетбол", "волейбол", "теннис", "ракетка", "валан", "тренажер", "велосипед", "канат", "гольф", "сетка", "арбитр", "рефери", "обруч", "мат", "батут", "скакалка", "тир", "стадион", "каток"])

var film = Category(name: "Фильмы", words: ["Побег из Шоушенка", "Зеленая миля", "Форрест Гамп", "Леон", "Начало", "Список Шиндлера", "Король Лев", "Бойцовский клуб", "Достучаться до небес", "Иван Васиeльевич меняет профессию", "Престиж", "Крестный отец", "Игры разума", "Криминальное чтиво", "Операция «Ы» и другие приключения Шурика", "Жизнь прекрасна", "Карты, деньги и два ствола", "Назад в будущее", "Гладиатор", "Пролетая над гнездом кукушки", "Большой куш", "Отступники", "Бриллиантовая рука", "ВАЛЛ•И", "Американская история Икс", "Пираты Карибского моря: Проклятие Черной жемчужины", "Пианист", "Поймай меня, если сможешь", "Хатико: Самый верный друг", "Матрица", "Властелин колец: Возвращение Короля", "Как приручить дракона", "Запах женщины", "Джентльмены удачи", "Пробуждение", "Шоу Трумана", "Остров проклятых", "В бой идут одни старики", "Терминатор 2: Судный день", "Семь", "Игра", "Властелин колец: Братство кольца", "Титаник", "Властелин колец: Две крепости", "В джазе только девушки", "Хороший, плохой, злой", "Молчание ягнят", "Унесённые призраками", "Крестный отец 2", "Кавказская пленница, или новые приключения Шурика", "Шерлок Холмс и доктор Ватсон: Собака Баскервилей", "Нокдаун", "Храброе сердце", "12 разгневанных мужчин", "Хористы", "Темный рыцарь", "Человек дождя", "Собачье сердцe", "Шестое чувство", "Эффект бабочки"])

var animals = Category(name: "Животные", words: ["cобака", "леопард", "гепард", "коала", "ягуар", "зоопарк", "хомяк", "медведь", "террариум", "аквариум", "ишак", "крокодил", "бегемот", "осьминог", "дельфин", "акула", "спаниель", "доберман", "терьер", "болонка", "овчарка", "колли", "экстерьер", "гиппопотам", "обезьяна", "шимпанзе", "мартышка", "черепаха", "шиншилла", "аллигатор", "корова", "ньюфаунленд", "динозавр", "мамонт", "кенгуру", "жираф", "копыта", "кобель", "куропатка", "гиббон", "барсук", "олень", "косуля", "варан", "верблюд", "панцирь", "лемур", "барбос", "аллюр", "галоп", "ипподром", "берлога", "логово", "поросенок", "кабан", "вольер", "свирепый", "рыба", "паук", "крыса"])

var history = Category(name: "История", words: ["война", "урок", "рассказ", "школа", "предмет", "учебник", "наука", "Россия", "учитель", "историк", "книга", "страна", "прошлое", "жизнь", "мир", "память", "событие", "век", "древность", "сказка", "время", "даты", "царь", "эпоха", "знания", "Египет", "летопись", "археология", "эволюция", "год", "раскопки", "революция", "люди", "мира", "география", "человек", "древняя", "Русь", "король", "Гитлер", "быль", "правитель", "повествование", "культура", "динозавры", "давно", "средневековье", "государство", "Греция", "Ленин", "отечества", "повесть", "предки", "человечество", "будущее", "карта", "Наполеон", "любви", "учить", "битва"])
