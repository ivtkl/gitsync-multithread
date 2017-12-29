﻿///////////////////////////////////////////////////////////////////
//
#Использовать cli

#Использовать "."
#Использовать "../core"

Перем Лог;
Перем Плагины;
Перем ВерсияПлатформы;
Перем ВыводДополнительнойИнформации;
Перем ВременныйКаталогРаботы;
Перем ДоменПочты;
///////////////////////////////////////////////////////////////////////////////

Процедура ВыполнитьПриложение()
	
	Приложение = Новый КонсольноеПриложение(ПараметрыПриложения.ИмяПриложения(), "Приложение для синхронизации Хранилища 1С с git");
	Приложение.Версия("version", ПараметрыПриложения.Версия());

	ВерсияПлатформы = Приложение.Опция("v8version", "8.3", "маска версии платформы (8.3, 8.3.5, 8.3.6.2299 и т.п.)").ВОкружении("GITSYNC_V8VERSION");
	ВыводДополнительнойИнформации = Приложение.Опция("v verbose", Ложь, "вывод отладочной информация в процессе выполнении").Флаговый().ВОкружении("GITSYNC_VERSOBE");
	Плагины = Приложение.Опция("p plugins", "", "плагины к загрузке и исполнению (дополнительное ограничение)").ТМассивСтрок().ВОкружении("GITSYNC_RUN_PLUGINS");	
	ВременныйКаталогРаботы = Приложение.Опция("t tempdir", "", "путь к каталогу временных файлов").ВОкружении("GITSYNC_TEMP");
	ДоменПочты= Приложение.Опция("e email", "localhost", "домен почты для пользователей git").ВОкружении("GITSYNC_EMAIL");
	
	Приложение.ДобавитьКоманду("usage u", "Выводит примеры использования", Новый КомандаUsage);
	Приложение.ДобавитьКоманду("init i", "Инициализация структуры нового хранилища git. Подготовка к синхронизации", Новый КомандаInit);
	Приложение.ДобавитьКоманду("sync s", "Выполняет синхронизацию хранилища 1С с git-репозиторием", Новый КомандаSync);
	Приложение.ДобавитьКоманду("clone c", "Клонирует существующий репозиторий и создает служебные файлы", Новый КомандаClone);
	//Приложение.ДобавитьКоманду("all a", "Запускает синхронизацию по нескольким репозиториям", Новый КомандаAll);
	Приложение.ДобавитьКоманду("set-version v", "Устанавливает необходимую версию в файл VERSION", Новый КомандаSetVersion);
	Приложение.ДобавитьКоманду("plugins p", "Управление плагинами gitsync", Новый КомандаPlugins);
	
	ПараметрыПриложения.ПодготовитьПлагины(Приложение);

	Приложение.УстановитьДействиеПередВыполнением(ЭтотОбъект);

	Приложение.Запустить(АргументыКоманднойСтроки);
	
КонецПроцедуры // ВыполнениеКоманды()

Процедура ПередВыполнениемКоманды(Знач Команда) Экспорт

	Команда.ПередВыполнениемКоманды(Команда);

	Лог.Отладка("Устанавливаю общие параметры");
	ПараметрыПриложения.УстановитьВерсиюПлатформы(ВерсияПлатформы.Значение);
	ПараметрыПриложения.УстановитьРежимВыводаДополнительнойИнформации(ВыводДополнительнойИнформации.Значение);
	ПараметрыПриложения.УстановитьПлагины(Плагины.Значение);
	ПараметрыПриложения.УстановитьДоменПочты(ДоменПочты.Значение);
	ПараметрыПриложения.УстановитьРежимОтладкиПриНеобходимости(ВыводДополнительнойИнформации.Значение);

	ПараметрыПриложения.УстановитьВременныйКаталог(ВременныйКаталогРаботы.Значение);

КонецПроцедуры

Процедура ИмяПроцедуры() Экспорт
	
КонецПроцедуры

///////////////////////////////////////////////////////

Лог = ПараметрыПриложения.Лог();

Попытка
	
	ВыполнитьПриложение();
	
Исключение
	
	Лог.КритичнаяОшибка(ОписаниеОшибки());
	ЗавершитьРаботу(ПараметрыПриложения.РезультатыКоманд().ОшибкаВремениВыполнения);
	
КонецПопытки;