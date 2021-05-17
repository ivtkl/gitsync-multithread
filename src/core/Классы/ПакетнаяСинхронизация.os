#Использовать configor

Перем Лог; // Объект, для логирования

Перем УдалятьВременныеФайлы; // Булево, признак удаления временных файлов
Перем КоличествоЦикловОжиданияЛицензииПоУмолчанию; // Число, количество попыток получения лицензии

Перем АвторизацияВХранилище; // Структура ключи <Пользователь>, <ПарольПользователя>
Перем ПутьКИсполняемомуФайлуGit; // Строка, полный путь к исполняемому файлу git

///////////////////////////////////////////////////////////////////////////////////////////////
// ПРОГРАММНЫЙ ИНТЕРФЕЙС

Перем ДоменПочтыДляGitПоУмолчанию; // Строка, домен пользователей по умолчанию
Перем ТекущаяВерсияПлатформы; // Строка, используемая версия 1С.Предприятие

Перем ТаймерПовторения;
Перем ПутьКФайлуНастроек;
Перем КаталогПлагинов;
Перем ПутьКФайлуВключенныхПлагинов;
Перем ПутьКВременномуКаталогу;

Перем ИндексРепозиториев;
Перем НастройкиПоУмолчанию;
Перем РепозиторииСинхронизации;

#Область Публичное_API

// Устанавливает параметры авторизации в хранилище конфигурации 1С
//
// Параметры:
//   Пользователь - Строка - пользователь хранилища конфигурации 1С
//   Пароль - Строка - пароль пользователя хранилища конфигурации 1С
//
// Возвращаемое значение:
//   Объект.МенеджерСинхронизации - ссылка на текущий объект класса <МенеджерСинхронизации>
//
Функция АвторизацияВХранилищеКонфигурации(Знач Пользователь, Знач Пароль) Экспорт

	Лог.Отладка("Установлена авторизация в хранилище пользователь <%1>, пароль <%2>", Пользователь, Пароль);
	АвторизацияВХранилище.Вставить("ПользовательХранилища" , Пользователь);
	АвторизацияВХранилище.Вставить("ПарольХранилища", Пароль);

	Возврат ЭтотОбъект;

КонецФункции

// Устанавливает признак необходимости удаления временных файлов
//
// Параметры:
//   ПарамУдалятьВременныеФайлы - Булево - признак необходимости удаления временных файлов
//
// Возвращаемое значение:
//   Объект.МенеджерСинхронизации - ссылка на текущий объект класса <МенеджерСинхронизации>
//
Функция РежимУдаленияВременныхФайлов(Знач ПарамУдалятьВременныеФайлы) Экспорт

	УдалятьВременныеФайлы = ПарамУдалятьВременныеФайлы;
	Возврат ЭтотОбъект;

КонецФункции

// Устанавливает количество циклов ожидания лицензий
//
// Параметры:
//   КоличествоЦиклов - Число - количество циклов ожидания лицензии
//
// Возвращаемое значение:
//   Объект.МенеджерСинхронизации - ссылка на текущий объект класса <МенеджерСинхронизации>
//
Функция ЦикловОжиданияЛицензии(Знач КоличествоЦиклов) Экспорт

	КоличествоЦикловОжиданияЛицензииПоУмолчанию = КоличествоЦиклов;
	Возврат ЭтотОбъект;

КонецФункции

// Устанавливает уровень вывода логов
//
// Параметры:
//   НовыйУровеньЛога - Строка - уровень вывода лога
//
// Возвращаемое значение:
//   Объект.МенеджерСинхронизации - ссылка на текущий объект класса <МенеджерСинхронизации>
//
Функция УровеньЛога(Знач НовыйУровеньЛога) Экспорт

	Лог.УстановитьУровень(НовыйУровеньЛога);
	Возврат ЭтотОбъект;

КонецФункции

// Устанавливает домен для почты по умолчанию
//
// Параметры:
//   НовыйДоменПочтыДляGit - Строка - новый домен для почты по умолчанию
//
// Возвращаемое значение:
//   Объект.МенеджерСинхронизации - ссылка на текущий объект класса <МенеджерСинхронизации>
//
Функция ДоменПочтыПоУмолчанию(Знач НовыйДоменПочтыДляGit) Экспорт

	ДоменПочтыДляGitПоУмолчанию = НовыйДоменПочтыДляGit;
	Возврат ЭтотОбъект;

КонецФункции

// Устанавливает версию платформы 1С
//
// Параметры:
//   НоваяВерсияПлатформы - Строка - версия платформы 1С используемой для работы
//
// Возвращаемое значение:
//   Объект.МенеджерСинхронизации - ссылка на текущий объект класса <МенеджерСинхронизации>
//
Функция ВерсияПлатформы(Знач НоваяВерсияПлатформы) Экспорт

	ТекущаяВерсияПлатформы = НоваяВерсияПлатформы;
	Возврат ЭтотОбъект;

КонецФункции

// Устанавливает путь к исполняемому файлу git
//
// Параметры:
//   НовыйПутьКИсполняемомуФайлуГит - Строка - путь к исполняемому файлу git
//
// Возвращаемое значение:
//   Объект.МенеджерСинхронизации - ссылка на текущий объект класса <МенеджерСинхронизации>
//
Функция ИсполняемыйФайлГит(Знач НовыйПутьКИсполняемомуФайлуГит) Экспорт

	ПутьКИсполняемомуФайлуGit = НовыйПутьКИсполняемомуФайлуГит;
	Возврат ЭтотОбъект;

КонецФункции

// Устанавливает путь к платформе 1С
//
// Параметры:
//   НовыйПутьКПлатформе - Строка - путь к исполняемому файлу платформы 1С.Предприятие
//
// Возвращаемое значение:
//   Объект.МенеджерСинхронизации - ссылка на текущий объект класса <МенеджерСинхронизации>
//
Функция ПутьКПлатформе(Знач НовыйПутьКПлатформе) Экспорт
	
	ТекущийПутьКПлатформе = НовыйПутьКПлатформе;
	Возврат ЭтотОбъект;
	
КонецФункции

// Читает настройки пакетной синхронизации из соответствия
//
// Параметры:
//   НастройкиСинхронизации - Соответствие - набор настроек для пакетной синхронизации
//
Процедура ПрочитатьНастройки(Знач НастройкиСинхронизации) Экспорт
	
	Лог.Отладка("Количество настроек <%1>", НастройкиСинхронизации.Количество());

	КонструкторПараметров = КонструкторПараметровПакетнойСинхронизации();
	КонструкторПараметров.ИзСоответствия(НастройкиСинхронизации);

	Параметры = КонструкторПараметров.ВСтруктуру();

	НастройкиПоУмолчанию = Параметры.НастройкиПоУмолчанию;

	ДополнитьНастройкиПоУмолчания();

	РепозиторииСинхронизации = Параметры.Репозитории;

КонецПроцедуры

// Устанавливает таймер повторения пакетной синхронизации
//
// Параметры:
//   НовыйТаймерПовторения - Число - таймер повторной синхронизации, сек
//
// Возвращаемое значение:
//   Объект.МенеджерСинхронизации - ссылка на текущий объект класса <МенеджерСинхронизации>
//
Функция ТаймерПовторения(Знач НовыйТаймерПовторения) Экспорт
	ТаймерПовторения = НовыйТаймерПовторения;
	Возврат ЭтотОбъект;
КонецФункции

// Устанавливает путь к каталогу плагинов
//
// Параметры:
//   НовыйКаталогПлагинов - Строка - путь к каталогу плагинов
//
// Возвращаемое значение:
//   Объект.МенеджерСинхронизации - ссылка на текущий объект класса <МенеджерСинхронизации>
//
Функция КаталогПлагинов(Знач НовыйКаталогПлагинов) Экспорт
	КаталогПлагинов = НовыйКаталогПлагинов;
	Возврат ЭтотОбъект;
КонецФункции

// Выполняет пакетную синхронизацию
//
Процедура ВыполнитьСинхронизацию(Знач КоличествоПотоков = 1, Знач СтрокаСоединенияИБ = "",
								Знач ПользовательИБ = "", Знач ПарольПользователяИБ = "") Экспорт
	
	ПодготовитьИндексРепозиториев();

	Пока Истина Цикл

		ПакетнаяСинхронизация(СтрокаСоединенияИБ, ПользовательИБ, ПарольПользователяИБ);

		Если ТаймерПовторения <= 0 Тогда

			Прервать;

		Иначе
			
			Лог.Информация("Ожидаем <%1> секунд перед новым циклом", ТаймерПовторения);
			Приостановить(ТаймерПовторения * 1000);

		КонецЕсли;

	КонецЦикла;

	УдалитьВременныеФайлыПриНеобходимости();

КонецПроцедуры

// Выполняет пакетную синхронизацию
//
Процедура ВыполнитьСинхронизациюПоНастройке(Знач ИмяНастройкиСинхронизации, Знач СтрокаСоединенияИБ = "",
											Знач ПользовательИБ = "", Знач ПарольПользователяИБ = "") Экспорт
	
	ПодготовитьИндексРепозиториев();

	Пока Истина Цикл

		РепоСинхронизации = ИндексРепозиториев[ИмяНастройкиСинхронизации];
		
		Если РепоСинхронизации = Неопределено Тогда
			Лог.Информация("Не найдена или отключена настройка синхронизации <%1>", ИмяНастройкиСинхронизации);
			Прервать;
		КонецЕсли;

		Лог.Информация("Начата синхронизация с репозиторием <%1> ", ИмяНастройкиСинхронизации);

		ВременныеФайлыДо = ВременныеФайлы.Файлы();

		Если ЗначениеЗаполнено(СтрокаСоединенияИБ) Тогда
			РепоСинхронизации.УстановитьКонтекст(СтрокаСоединенияИБ, ПользовательИБ, ПарольПользователяИБ);
		КонецЕсли;

		РепоСинхронизации.Синхронизировать();
			
		Если УдалятьВременныеФайлы Тогда					
			ВременныеФайлы.УдалитьНакопленныеВременныеФайлы(ВременныеФайлыДо);
		КонецЕсли;

		Если ТаймерПовторения <= 0 Тогда

			Прервать;

		Иначе
			
			Лог.Информация("Ожидаем <%1> секунд перед новым циклом", ТаймерПовторения);
			Приостановить(ТаймерПовторения * 1000);

		КонецЕсли;

	КонецЦикла;

	УдалитьВременныеФайлыПриНеобходимости();

КонецПроцедуры

#КонецОбласти

#Область Интерфейс_конструктора_параметров

Функция КонструкторОбщихПараметров()
	
	ПараметрыПлагины = Новый КонструкторПараметров();
	ПараметрыПлагины.ПолеМассив("ВключенныеПлагины enable", Тип("Строка"))
		.ПолеМассив("ОтключенныеПлагины disable", Тип("Строка"))
		.ПолеМассив("ДополнительныеПлагины extra additional more", Тип("Строка"))
		;

	ПараметрыНастроекПлагинов = Новый КонструкторПараметров();
	ПараметрыНастроекПлагинов.ПроизвольныеПоля();

	КонструкторПараметров = Новый КонструкторПараметров();

	КонструкторПараметров.ПолеСтрока("ПользовательХранилища storage-user user")
		.ПолеСтрока("ПарольПользователяХранилища storage-pwd storage-password password pwd")
		.ПолеСтрока("ПутьИсполняемомуФайлуГит git-path git")
		.ПолеСтрока("ПутьКВременномуКаталогу temp-dir tempdir temp")
		.ПолеСтрока("ВерсияПлатформы v8version v8")
		.ПолеСтрока("ДоменПочтыПоУмолчанию domain-email email")
		.ПолеЧисло("КоличествоЦикловОжиданияЛицензии lic-try-count")
		.ПолеОбъект("Плагины plugins", ПараметрыПлагины)
		.ПолеОбъект("НастройкиПлагинов plugins-config flags", ПараметрыНастроекПлагинов)
		;

	Возврат КонструкторПараметров;

КонецФункции

Функция КонструкторПараметровРепозитория()
	
	КонструкторПараметров = КонструкторОбщихПараметров();
	
	КонструкторПараметров.ПолеБулево("Отключено disable", Ложь)
		.ПолеСтрока("Наименование storage-name name")
		.ПолеСтрока("ПутьКХранилищу storage-path path")
		.ПолеСтрока("ПутьКРабочемуКаталогу work-dir git-local-path dir")
		.ПолеСтрока("ИмяРасширения extention")
		;

	Возврат КонструкторПараметров;

КонецФункции

Функция КонструкторПараметровПакетнойСинхронизации() Экспорт

	КонструкторПараметров = Новый КонструкторПараметров();

	ОбщиеПараметры = КонструкторОбщихПараметров();
	ПараметрыРепозитория = КонструкторПараметровРепозитория();

	КонструкторПараметров.ПолеОбъект("НастройкиПоУмолчанию globals default", ОбщиеПараметры)
		.ПолеМассив("Репозитории repositories", ПараметрыРепозитория)
		;
	
	Возврат КонструкторПараметров;

КонецФункции
	

#КонецОбласти

Процедура ПакетнаяСинхронизация(Знач СтрокаСоединенияИБ = "", Знач ПользовательИБ = "", Знач ПарольПользователяИБ = "")

	Лог.Информация("Начата пакетная синхронизация с <%1> репозиториями", ИндексРепозиториев.Количество());

	Для каждого КлючЗначение Из ИндексРепозиториев Цикл

		ВременныеФайлыДо = ВременныеФайлы.Файлы();
			
		Репозиторий = КлючЗначение.Значение; 
		Репозиторий.Синхронизировать(СтрокаСоединенияИБ, ПользовательИБ, ПарольПользователяИБ);

		Если УдалятьВременныеФайлы Тогда					
			ВременныеФайлы.УдалитьНакопленныеВременныеФайлы(ВременныеФайлыДо);
		КонецЕсли;

	КонецЦикла;

КонецПроцедуры

Процедура ПодготовитьИндексРепозиториев()

	ИндексРепозиториев = Новый Соответствие();

	Лог.Отладка("Готовлю индекс для <%1> репозиториев", РепозиторииСинхронизации.Количество());
	Для каждого ПараметрыРепозитория Из РепозиторииСинхронизации Цикл


		РепоСинхронизации = Новый РепозиторийСинхронизации();
		РепоСинхронизации.КаталогПлагинов(КаталогПлагинов)
							// .ФайлВключенныхПлагинов(ПутьКФайлуВключенныхПлагинов)
							// .УровеньЛога(Лог.ПолучитьУровеньЛога())
							;
		
		ИндексРепозиториев.Вставить(ПараметрыРепозитория.Наименование, РепоСинхронизации);

		ДополнитьПараметрыРепозитория(ПараметрыРепозитория);
		
		РепоСинхронизации.ПрочитатьПараметры(ПараметрыРепозитория);

	КонецЦикла;

КонецПроцедуры

Процедура ДополнитьНастройкиПоУмолчания()
	
	Если ЗначениеЗаполнено(АвторизацияВХранилище.ПользовательХранилища) Тогда
		НастройкиПоУмолчанию.Вставить("ПользовательХранилища", АвторизацияВХранилище.ПользовательХранилища);
		НастройкиПоУмолчанию.Вставить("ПарольПользователяХранилища", АвторизацияВХранилище.ПарольХранилища);
	КонецЕсли;

	ЗаполнитьПриемникПриНеобходимости("ПутьИсполняемомуФайлуГит", ПутьКИсполняемомуФайлуGit, НастройкиПоУмолчанию);
	ЗаполнитьПриемникПриНеобходимости("ПутьКВременномуКаталогу", ПутьКВременномуКаталогу, НастройкиПоУмолчанию);
	ЗаполнитьПриемникПриНеобходимости("ВерсияПлатформы", ТекущаяВерсияПлатформы, НастройкиПоУмолчанию);
	ЗаполнитьПриемникПриНеобходимости("ДоменПочтыПоУмолчанию", ДоменПочтыДляGitПоУмолчанию, НастройкиПоУмолчанию);
	ЗаполнитьПриемникПриНеобходимости("КоличествоЦикловОжиданияЛицензии", КоличествоЦикловОжиданияЛицензииПоУмолчанию, НастройкиПоУмолчанию);

КонецПроцедуры

Процедура ДополнитьПараметрыРепозитория(ПараметрыРепозитория)

	ГлобальныеПараметры = НастройкиПоУмолчанию;

	ЗаполнитьПриНеобходимости("ПользовательХранилища", ГлобальныеПараметры, ПараметрыРепозитория);
	ЗаполнитьПриНеобходимости("ПарольПользователяХранилища", ГлобальныеПараметры, ПараметрыРепозитория);
	ЗаполнитьПриНеобходимости("ПутьИсполняемомуФайлуГит", ГлобальныеПараметры, ПараметрыРепозитория);
	ЗаполнитьПриНеобходимости("ПутьКВременномуКаталогу", ГлобальныеПараметры, ПараметрыРепозитория);
	ЗаполнитьПриНеобходимости("ВерсияПлатформы", ГлобальныеПараметры, ПараметрыРепозитория);
	ЗаполнитьПриНеобходимости("ДоменПочтыПоУмолчанию", ГлобальныеПараметры, ПараметрыРепозитория);
	ЗаполнитьПриНеобходимости("КоличествоЦикловОжиданияЛицензии", ГлобальныеПараметры, ПараметрыРепозитория);

	ОбъединитьПлагины(ГлобальныеПараметры.Плагины, ПараметрыРепозитория.Плагины);
	ОбъединитьНастройкиПлагинов(ГлобальныеПараметры.НастройкиПлагинов, ПараметрыРепозитория.НастройкиПлагинов);

КонецПроцедуры

Процедура ЗаполнитьПриемникПриНеобходимости(Ключ, Значение, Приемник)

	Если Не ЗначениеЗаполнено(Значение) Тогда
		Возврат;
	КонецЕсли;

	ЗначениеПриемник = Приемник[Ключ];

	Если ЗначениеЗаполнено(ЗначениеПриемник) Тогда
		Возврат;
	КонецЕсли;

	Приемник.Вставить(Ключ, Значение);

КонецПроцедуры

Процедура ЗаполнитьПриНеобходимости(КлючНастройки, Источник, Приемник)

	ЗначениеИсточник = Источник[КлючНастройки];

	Если Не ЗначениеЗаполнено(ЗначениеИсточник) Тогда
		Возврат;
	КонецЕсли;

	ЗначениеПриемник = Приемник[КлючНастройки];

	Если ЗначениеЗаполнено(ЗначениеПриемник) Тогда
		Возврат;
	КонецЕсли;

	Приемник.Вставить(КлючНастройки, ЗначениеИсточник);

КонецПроцедуры

Процедура ОбъединитьНастройкиПлагинов(ГлобальныеНастройкиПлагинов, НастройкиПлагиновРепозитория)

	Лог.Отладка("Количество <%1> в НастройкиПлагиновРепозитория", НастройкиПлагиновРепозитория.Количество());

	НастройкиПлагиновПустые = НастройкиПлагиновРепозитория.Количество() = 0;

	Для каждого ГлобальнаяНастройкаПлагина Из ГлобальныеНастройкиПлагинов Цикл

		КлючНастройки = ГлобальнаяНастройкаПлагина.Ключ;
		ЗначениеНастройки = ГлобальнаяНастройкаПлагина.Значение;
		Лог.Отладка("Получаю настройки ключ <%1>", КлючНастройки);
		Лог.Отладка("Глобальное значение ключ <%1>", ЗначениеНастройки);

		Если НастройкиПлагиновПустые Тогда
			НастройкиПлагиновРепозитория.Вставить(КлючНастройки, ЗначениеНастройки);
		КонецЕсли;

		ЗначениеНастройкиИзРепозитория = ПолучитьЗначениеПоКлючу(НастройкиПлагиновРепозитория, КлючНастройки);
		Лог.Отладка("Ключа <%1> значение из репозитория <%2>", КлючНастройки, ЗначениеНастройкиИзРепозитория);

		Если ЗначениеНастройкиИзРепозитория = Неопределено Тогда

			Лог.Отладка("Устанавливаю ключ настройки <%1> в значение <%2>", КлючНастройки, ЗначениеНастройки);
			НастройкиПлагиновРепозитория.Вставить(КлючНастройки, ЗначениеНастройки);

		КонецЕсли;

	КонецЦикла;

КонецПроцедуры

Функция ПолучитьЗначениеПоКлючу(ВходящаяНастройка, КлючНастройки)

	ЗначениеКлюча = Неопределено;

	Если Тип("Структура") = ТипЗнч(ВходящаяНастройка) Тогда
		
		ВходящаяНастройка.Свойство(КлючНастройки, ЗначениеКлюча);

	Иначе

		ЗначениеКлюча = ВходящаяНастройка[КлючНастройки];

	КонецЕсли;

	Возврат ЗначениеКлюча;
	
КонецФункции

Процедура ОбъединитьПлагины(ГлобальныеПлагины, ПлагиныРепозитория)
	
	ВключенныеПлагины = ГлобальныеПлагины.ВключенныеПлагины;
	
	Если Не ПлагиныРепозитория.Свойство("ВключенныеПлагины") Тогда
		ПлагиныРепозитория.Вставить("ВлюченныеПлагины", ВключенныеПлагины);
	Иначе
	
		ВключенныеПлагиныРепозитория = ПлагиныРепозитория.ВключенныеПлагины;
	
		Если ВключенныеПлагиныРепозитория.Количество() = 0 Тогда
			ДополнитьМассив(ВключенныеПлагины, ВключенныеПлагиныРепозитория);
		КонецЕсли;
		
	КонецЕсли;
	
	ОтключенныеПлагины = ГлобальныеПлагины.ОтключенныеПлагины;
	
	Если Не ПлагиныРепозитория.Свойство("ОтключенныеПлагины") Тогда
		ПлагиныРепозитория.Вставить("ОтключенныеПлагины", ОтключенныеПлагины);
	Иначе
	
		ОтключенныеПлагиныРепозитория = ПлагиныРепозитория.ОтключенныеПлагины;
		Если ОтключенныеПлагиныРепозитория.Количество() = 0 Тогда
			ДополнитьМассив(ОтключенныеПлагины, ОтключенныеПлагиныРепозитория);
		КонецЕсли;
	КонецЕсли;

КонецПроцедуры

Процедура ДополнитьМассив(Источник, Приемник)

	Для каждого Элемент Из Источник Цикл
		
		Если Приемник.Найти(Элемент) = Неопределено Тогда
			Приемник.Добавить(Элемент);
		КонецЕсли;

	КонецЦикла;
	
КонецПроцедуры

// Удаляет временные файлы при необходимости
// Если передана пустая строка, то удаляются все зарегистрированные временные файлы
//
// Параметры:
//   ПутьКФайлу - Строка - полный путь файла или пустая строка
//
Процедура УдалитьВременныеФайлыПриНеобходимости(Знач ПутьКФайлу = "")
	
	Если НЕ УдалятьВременныеФайлы Тогда
		Возврат;
	КонецЕсли;
	
	Если ПутьКФайлу = "" Тогда
		ВременныеФайлы.Удалить();
	Иначе
		ВременныеФайлы.УдалитьФайл(ПутьКФайлу);
	КонецЕсли;
	
КонецПроцедуры

Процедура ПриСозданииОбъекта()
	
	ИндексРепозиториев = Новый Соответствие;
	АвторизацияВХранилище = Новый Структура;
	ТаймерПовторения = 0;

	Лог = Логирование.ПолучитьЛог("oscript.lib.gitsync.batch");

КонецПроцедуры