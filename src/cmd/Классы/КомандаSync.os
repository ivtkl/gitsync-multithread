﻿
Перем Лог;

Процедура ОписаниеКоманды(Команда) Экспорт
	
	Команда.Опция("u storage-user", "", "пользователь хранилища конфигурации")
					.ТСтрока()
					.ВОкружении("GITSYNC_STORAGE_USER")
					.ПоУмолчанию("Администратор");

	Команда.Опция("p storage-pwd", "", "пароль пользователя хранилища конфигурации")
					.ТСтрока()
					.ВОкружении("GITSYNC_STORAGE_PASSWORD GITSYNC_STORAGE_PWD");
	
	Команда.Опция("e extension", "", "имя расширения для работы с хранилищем расширения")
					.ТСтрока()
					.ВОкружении("GITSYNC_EXTENSION");

	Команда.Аргумент("PATH", "", "Путь к хранилищу конфигурации 1С.")
					.ТСтрока()
					.ВОкружении("GITSYNC_STORAGE_PATH");
	Команда.Аргумент("WORKDIR", "", "Каталог исходников внутри локальной копии git-репозитария.")
					.ТСтрока()
					.ВОкружении("GITSYNC_WORKDIR")
					.Обязательный(Ложь)
					.ПоУмолчанию(ТекущийКаталог());

	ПараметрыПриложения.ВыполнитьПодпискуПриРегистрацииКомандыПриложения(Команда);
	
КонецПроцедуры

Процедура ВыполнитьКоманду(Знач Команда) Экспорт

	Лог.Информация("Начало выполнение команды <sync>");
	
	ПутьКХранилищу			= Команда.ЗначениеАргумента("PATH");
	КаталогРабочейКопии		= Команда.ЗначениеАргумента("WORKDIR");
	
	ПользовательХранилища		= Команда.ЗначениеОпции("--storage-user");
	ПарольПользователяХранилища	= Команда.ЗначениеОпции("--storage-pwd");
	ИмяРасширения				= Команда.ЗначениеОпции("extension");

	ФайлКаталогРабочейКопии = Новый Файл(КаталогРабочейКопии);
	КаталогРабочейКопии = ФайлКаталогРабочейКопии.ПолноеИмя;

	Лог.Отладка("ПутьКХранилищу = " + ПутьКХранилищу);
	Лог.Отладка("КаталогРабочейКопии = " + КаталогРабочейКопии);

	МассивФайлов = НайтиФайлы(КаталогРабочейКопии, "src");
	КаталогИсходников = КаталогРабочейКопии;
	Если МассивФайлов.Количество() > 0  Тогда
		КаталогИсходников = МассивФайлов[0].ПолноеИмя;
	КонецЕсли;

	ОбщиеПараметры = ПараметрыПриложения.Параметры();
	МенеджерПлагинов = ОбщиеПараметры.УправлениеПлагинами;
	
	ИндексПлагинов = МенеджерПлагинов.ПолучитьИндексПлагинов();

	Распаковщик = Новый МенеджерСинхронизации();
	Распаковщик.ВерсияПлатформы(ОбщиеПараметры.ВерсияПлатформы)
			   .ПутьКПлатформе(ОбщиеПараметры.ПутьКПлатформе)
			   .ДоменПочтыПоУмолчанию(ОбщиеПараметры.ДоменПочты)
			   .ИсполняемыйФайлГит(ОбщиеПараметры.ПутьКГит)
			   .ПодпискиНаСобытия(ИндексПлагинов)
			   .ПараметрыПодписокНаСобытия(Команда.ПараметрыКоманды())
			   .УровеньЛога(ПараметрыПриложения.УровеньЛога())
			   .ИмяРасширения(ИмяРасширения)
			   .АвторизацияВХранилищеКонфигурации(ПользовательХранилища, ПарольПользователяХранилища)
			   .РежимУдаленияВременныхФайлов(Истина)
			   .РежимРаботыСХранилищемРасширения(ОбщиеПараметры.ЭтоРасширение)
			   .Синхронизировать(КаталогИсходников, ПутьКХранилищу);

	Лог.Информация("Завершено выполнение команды <sync>");
		
КонецПроцедуры

Лог = ПараметрыПриложения.Лог();