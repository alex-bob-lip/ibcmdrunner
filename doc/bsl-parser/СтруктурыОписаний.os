///////////////////////////////////////////////////////////////////////////////
//
// Содержит описания структур для разбора конфигураций
//
///////////////////////////////////////////////////////////////////////////////

Перем СвойстваОбъектов;
Перем ПолученныеОписанияОбъектов;

///////////////////////////////////////////////////////////////////////////////
// ПРОГРАММНЫЙ ИНТЕРФЕЙС
///////////////////////////////////////////////////////////////////////////////

#Область КоллекцииОбъектов

// Таблица объектов конфигурации
//
//  Возвращаемое значение:
//   ТаблицаЗначений - 
//		* Наименование - Наименование объекта конфигурации
//		* Тип - Тип объекта конфигурации
//		* ПолноеНаименование - Полное наименование объекта конфигурации. Тип + "." + Наименование
//		* ПутьКФайлу - Имя файла описания
//		* ПутьККаталогу - Каталог файлов описаний и прочих данных
//		* Подсистемы - Коллекция подсистем, в которых был замечен объект
//		* Описание - Структура описания объекта
//		* Родитель - Ссылка на родительский описание родительского объекта. Если объект подчиненн.
//
Функция ТаблицаОписанияОбъектовКонфигурации() Экспорт
	
	ОбъектыКонфигурации = Новый ТаблицаЗначений;
	Для каждого Реквизит Из РеквизитыОписанияОбъектовКонфигурации() Цикл
		
		ОбъектыКонфигурации.Колонки.Добавить(Реквизит);
		
	КонецЦикла;

	Возврат ОбъектыКонфигурации;
	
КонецФункции

// Таблица модулей конфигурации
//
//  Возвращаемое значение:
//   ТаблицаЗначений - 
//		* ТипМодуля - Тип модуля. Значение перечисления ТипМодуля
//		* Родитель - Объект конфигурации, которому принадлежит модель
//		* ПутьКФайлу - Имя файла модуля
//		* НаборБлоков - Структура модуля. Области, методы, операторы...
//		* Содержимое - Текст модуля
//		* РодительФорма - Описание формы, которой принадлежит модуль
//		* РодительКоманда - Описание команды, которой принадлежит модуль
//		* ОписаниеМодуля - Структура свойств модуля, актуально для общих модулей
//
Функция ТаблицаОписанияМодулей() Экспорт
	
	МодулиКонфигурации = Новый ТаблицаЗначений;

	Для каждого Реквизит Из РеквизитыМодуляКонфигурации() Цикл
		
		МодулиКонфигурации.Колонки.Добавить(Реквизит);
		
	КонецЦикла;
	
	Возврат МодулиКонфигурации;
	
КонецФункции

// Таблица соответствия подсистем и объектов включенных в них
//
//  Возвращаемое значение:
//   ТаблицаЗначений - 
//		* ОбъектМетаданных - Полное имя объекта конфигурации
//		* Имя - Имя подсистемы с учетом вложенности. ИмяРодительскойПодсистемы.ИмяПодсистемы
//		* Представление - Синоним подсистемы с учетом вложенности. СинонимРодительскойПодсистемы.СинонимПодсистемы
//		* ПодсистемаОписание - Комментарий подсистемы
//		* Визуальная - Подсистема выведена в интерфейс конфигурации
//		* Родитель - Описание родительской подсистемы
//		* ПредставлениеКратко - Синоним подсистемы без иерархии
//		* ИмяКратко - Имя подсистемы без иерархии
//
Функция ТаблицаОписанияПодсистем() Экспорт
	
	ОписаниеПодсистем = Новый ТаблицаЗначений;
	ОписаниеПодсистем.Колонки.Добавить("ОбъектМетаданных");
	ОписаниеПодсистем.Колонки.Добавить("Имя");
	ОписаниеПодсистем.Колонки.Добавить("Представление");
	ОписаниеПодсистем.Колонки.Добавить("ПодсистемаОписание");
	ОписаниеПодсистем.Колонки.Добавить("Визуальная");
	ОписаниеПодсистем.Колонки.Добавить("Родитель");
	ОписаниеПодсистем.Колонки.Добавить("ПредставлениеКратко");
	ОписаниеПодсистем.Колонки.Добавить("ИмяКратко");
	
	Возврат ОписаниеПодсистем;
	
КонецФункции

Функция РеквизитыМодуляКонфигурации() Экспорт
	
	Реквизиты = Новый Массив();

	Реквизиты.Добавить("ТипМодуля");
	Реквизиты.Добавить("Родитель");
	Реквизиты.Добавить("ПутьКФайлу");
	Реквизиты.Добавить("НаборБлоков");
	Реквизиты.Добавить("Содержимое");
	Реквизиты.Добавить("РодительФорма");
	Реквизиты.Добавить("РодительКоманда");
	Реквизиты.Добавить("ОписаниеМодуля");

	Возврат Реквизиты;

КонецФункции

Функция РеквизитыОписанияОбъектовКонфигурации() Экспорт
	
	Реквизиты = Новый Массив();

	Реквизиты.Добавить("Наименование");
	Реквизиты.Добавить("Тип");
	Реквизиты.Добавить("ПолноеНаименование");
	Реквизиты.Добавить("ПутьКФайлу");
	Реквизиты.Добавить("ПутьККаталогу");
	Реквизиты.Добавить("Подсистемы");
	Реквизиты.Добавить("Описание");
	Реквизиты.Добавить("Родитель");
	Реквизиты.Добавить("Конфигурация");

	Возврат Реквизиты;

КонецФункции

#КонецОбласти

// Создает пустышку описания объекта
//
// Параметры:
//   ТипОбъекта - Строка - Тип объекта или полное наименование (Тип.Наименование)
//	 Наименование - Строка - Имя объекта. 
//
//  Возвращаемое значение:
//   Структура - Данные описания объекта
//
Функция СоздатьОбъект(Знач ТипОбъекта, Знач Наименование = Неопределено) Экспорт
	
	Если Наименование = Неопределено 
		И СтрНайти(ТипОбъекта, ".") Тогда
		
		ТипОбъекта = Лев(ТипОбъекта, СтрНайти(ТипОбъекта, "."));
		Наименование = Сред(ТипОбъекта, Лев(ТипОбъекта, СтрНайти(ТипОбъекта, ".")) + 1);

	КонецЕсли;
	
	Если НЕ ЗначениеЗаполнено(Наименование) Тогда
		
		ВызватьИсключение "Не указано наименование создаваемого объекта. Имя - обязательный атрибут";
		
	КонецЕсли;
	
	ОписаниеОбъекта = ОписаниеСвойствОбъекта(ТипОбъекта);
	
	Данные = Новый Структура();
	
	Для Каждого Описание Из ОписаниеОбъекта.Свойства Цикл
		
		Значение = ?(ОписаниеОбъекта.ЕстьЗначенияПоУмолчанию, Описание.ЗначениеПоУмолчанию, "");

		Если ЗначениеЗаполнено(Описание.ТипЗначения) И НЕ ПустаяСтрока(Значение) Тогда
			
			Данные.Вставить(Описание.Наименование, (Новый ОписаниеТипов(Описание.ТипЗначения)).ПривестиЗначение(Значение));
			
		ИначеЕсли ЗначениеЗаполнено(Описание.ТипЗначения) Тогда
		
			Данные.Вставить(Описание.Наименование, Новый(Описание.ТипЗначения));
			
		Иначе

			Данные.Вставить(Описание.Наименование);

		КонецЕсли;
		
	КонецЦикла;
	
	Если ОписаниеОбъекта.ЕстьПодчиненные Тогда
		
		Данные.Вставить("Подчиненные", Новый Массив());
		
	КонецЕсли;

	Данные.Наименование = Наименование;
	
	Возврат Данные;
	
КонецФункции

// Создает минимальное описание объекта
//
// Параметры:
//   ТипОбъекта - Строка - Тип объекта или полное наименование (Тип.Наименование)
//	 Наименование - Строка - Имя объекта. 
//
//  Возвращаемое значение:
//   Структура - минимальное описание объекта
//
Функция СоздатьОбъектДляВключенияВРасширение(Знач ТипОбъекта, Знач Наименование = Неопределено) Экспорт
	
	Если Наименование = Неопределено 
		И СтрНайти(ТипОбъекта, ".") Тогда
		
		ТипОбъекта = Лев(ТипОбъекта, СтрНайти(ТипОбъекта, ".") - 1);
		Наименование = Сред(ТипОбъекта, СтрНайти(ТипОбъекта, ".") + 1);

	КонецЕсли;
	
	Если НЕ ЗначениеЗаполнено(Наименование) Тогда
		
		ВызватьИсключение "Не указано наименование создаваемого объекта. Имя - обязательный атрибут";
		
	КонецЕсли;
	
	ОписаниеОбъекта = ОписаниеСвойствОбъекта(ТипОбъекта);
	
	Данные = Новый Структура("Наименование, Принадлежность", Наименование);

	Для Каждого Свойство Из ОписаниеОбъекта.Свойства Цикл
		
		Если Свойство.ПереноситьВРасширение Тогда
			
			Данные.Вставить(Свойство.Наименование);

		КонецЕсли;
		
	КонецЦикла;
	
	Если ОписаниеОбъекта.ЕстьПодчиненные Тогда
		
		Данные.Вставить("Подчиненные", Новый Массив());
		
	КонецЕсли;
	
	Возврат Данные;
	
КонецФункции

// Метаданные объекта конфигурации
//
// Параметры:
//   ТипОбъекта - Строка - Тип объекта конфигурации, см ТипыОбъектовКонфигурации, ОбъектыКонфигурации.md
//
//  Возвращаемое значение:
//   Структура - Описание структуры и свойств объекта конфигурации
//
Функция ОписаниеСвойствОбъекта(Знач ТипОбъекта) Экспорт
	
	//ТипОбъекта = ТипыОбъектовКонфигурации.НормализоватьИмя(ТипОбъекта);

	Если ПолученныеОписанияОбъектов[ТипОбъекта] <> Неопределено Тогда
		
		Возврат ПолученныеОписанияОбъектов[ТипОбъекта];
		
	КонецЕсли;
	
	Свойства = СвойстваОбъектов[ТипОбъекта];
	БазовыеСвойства = БазовоеОписаниеСвойствОбъекта();
	
	Если Свойства = Неопределено Тогда
		
		Свойства = БазовыеСвойства;
		//ПараметрыПродукта.ПолучитьЛог().Предупреждение("Нет описания типа %1. Использовано описание по-умолчанию", ТипОбъекта);
		
	Иначе

		Для каждого Свойство Из БазовыеСвойства Цикл
			
			ЗаполнитьЗначенияСвойств(Свойства.Добавить(), Свойство);
			
		КонецЦикла;

	КонецЕсли;
	
	ОписаниеОбъекта = Новый Структура("Тип, Свойства, ЕстьПодчиненные, ЕстьЗначенияПоУмолчанию", ТипОбъекта);
	
	НормализованнаяТаблицаСвойств = Новый ТаблицаЗначений();
	НормализованнаяТаблицаСвойств.Колонки.Добавить("Наименование", Новый ОписаниеТипов("Строка"));
	НормализованнаяТаблицаСвойств.Колонки.Добавить("Реквизит", Новый ОписаниеТипов("Строка"));
	НормализованнаяТаблицаСвойств.Колонки.Добавить("МетодПреобразования", Новый ОписаниеТипов("Строка"));
	НормализованнаяТаблицаСвойств.Колонки.Добавить("ЗначениеПоУмолчанию", Новый ОписаниеТипов("Строка"));
	НормализованнаяТаблицаСвойств.Колонки.Добавить("ТипЗначения", Новый ОписаниеТипов("Строка"));
	НормализованнаяТаблицаСвойств.Колонки.Добавить("ЭтоКоллекция", Новый ОписаниеТипов("Булево"));
	НормализованнаяТаблицаСвойств.Колонки.Добавить("ПереноситьВРасширение", Новый ОписаниеТипов("Булево"));
	
	Для Каждого ОписаниеСвойства Из Свойства Цикл
		
		Свойство = НормализованнаяТаблицаСвойств.Добавить();
		ЗаполнитьЗначенияСвойств(Свойство, ОписаниеСвойства);
		Свойство.ЭтоКоллекция = Свойство.ТипЗначения = "Массив";
				
	КонецЦикла;

	ОписаниеОбъекта.Свойства = НормализованнаяТаблицаСвойств;
	ОписаниеОбъекта.ЕстьЗначенияПоУмолчанию = Свойства.Колонки.Найти("ЗначениеПоУмолчанию") <> Неопределено;
	
	ПолученныеОписанияОбъектов.Вставить(ТипОбъекта, ОписаниеОбъекта);
	
	Возврат ОписаниеОбъекта;
	
КонецФункции

///////////////////////////////////////////////////////////////////////////////
// СЛУЖЕБНЫЕ ПРОЦЕДУРЫ И ФУНКЦИИ
///////////////////////////////////////////////////////////////////////////////

Функция БазовоеОписаниеСвойствОбъекта()
	
	Возврат СвойстваОбъектов["Default"];
	
КонецФункции

// Процедура ЗагрузитьСвойстваОбъектов()
	
// 	ФайлОписаний = ОбъединитьПути(Утилиты.КаталогМакеты(), "СвойстваОбъектов.md");
	
// 	Чтение = Новый ЧтениеТекста();
// 	Чтение.Открыть(ФайлОписаний, КодировкаТекста.UTF8);
	
// 	СвойстваОбъектов = Новый Соответствие();
	
// 	Пока Истина Цикл
		
// 		СтрокаЗаголовка = Утилиты.НайтиСледующийЗаголовокMarkdown(Чтение, "## Реквизиты");
		
// 		Если СтрокаЗаголовка = Неопределено Тогда
			
// 			Прервать;
			
// 		КонецЕсли;
		
// 		ИмяТипа = СокрЛП(Сред(СтрокаЗаголовка, 13));
// 		ИмяТипа = ТипыОбъектовКонфигурации.НормализоватьИмя(ИмяТипа);
		
// 		Свойства = Утилиты.ПрочитатьТаблицуMarkdown(Чтение);
		
// 		СвойстваОбъектов.Вставить(ИмяТипа, Свойства);
		
// 	КонецЦикла;
	
// 	Чтение.Закрыть();
	
// КонецПроцедуры

Процедура ПРиСозданииОбъекта() Экспорт

	ПолученныеОписанияОбъектов = Новый Соответствие();
	
	// ЗагрузитьСвойстваОбъектов();

КонецПроцедуры

