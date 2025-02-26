	Процедура ПриСозданииНаСервереФормаДокумента(Форма) Экспорт //проверяет какой документ открыт
		
		ИмяФормы = Форма.ИмяФормы;
		
		Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
			
			ДобавлениеЭлементовФормаДокументаГруппаШапкаПраво(Форма); 
			
			ДобавлениеСогласованнойСкидкиКнопкиИГруппы(Форма);
			
		ИначеЕсли  ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" ИЛИ
			
			ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
			
			ДобавлениеЭлементовФормаДокументаГруппаШапкаПраво(Форма);
			
		ИначеЕсли  ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" ИЛИ 
			
			ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
			
			ДобавлениеЭлементовФормаДокументаПередСуммаДокумента(Форма); 
			
		КонецЕсли;		
		
	КонецПроцедуры
	
	
	#Область СлужебныйПрограммныйИнтерфейс
	
	
	Процедура ДобавлениеСогласованнойСкидкиКнопкиИГруппы(Форма)
		
		//Добавление ГРУППЫ Скидка , включающую:  поля Согласованная скидка и кнопку ПЕРЕСЧИТАТЬ ТАБЛИЦУ
		ГруппаСкидка = Форма.Элементы.Добавить("БС_ГруппаСкидка",Тип("ГруппаФормы"),Форма.Элементы.ГруппаШапкаЛево);
		
		ГруппаСкидка.Вид = ВидГруппыФормы.ОбычнаяГруппа;
		
		// Добавление поля СОГЛАСОВАННАЯ СКИДКА 	 
		ПолеВводаСогласованнаяСкидка = Форма.Элементы.Добавить("БС_СогласованнаяСкидка",Тип("ПолеФормы"), ГруппаСкидка);
		
		ПолеВводаСогласованнаяСкидка.Вид = ВидПоляФормы.ПолеВвода;
		
		ПолеВводаСогласованнаяСкидка.ПутьКДанным ="Объект.БС_СогласованнаяСкидка";
		
		// Установка действия при изменении поля СОГЛАСОВАННАЯ СКИДКА
		ПолеВводаСогласованнаяСкидка.УстановитьДействие("ПриИзменении", "БС_ПриИзмененииСогласованнаяСкидка"); 
		
		//Добавление команды для кнопки ПЕРЕСЧИТАТЬ ТАБЛИЦУ
		КомандаПересчитатьТаблицу = Форма.Команды.Добавить("БС_ПересчитатьТаблицу");
		
		КомандаПересчитатьТаблицу.Заголовок = "Пересчитать таблицу";
		
		КомандаПересчитатьТаблицу.Действие = "БС_ПересчитатьТаблицу";
		
		//Добавление кнопки ПЕРЕСЧИТАТЬ ТАБЛИЦУ
		КнопкаПересчитатьТаблицу = Форма.Элементы.Добавить("БС_ПересчитатьТаблицу", Тип("КнопкаФормы"), ГруппаСкидка);
		
		КнопкаПересчитатьТаблицу.ИмяКоманды = "БС_ПересчитатьТаблицу";
		
	КонецПроцедуры 
	
	
	Процедура ДобавлениеЭлементовФормаДокументаГруппаШапкаПраво(Форма); //добавляет поле контактное лицо
		
		Элементы = Форма.Элементы;
		
		ПолеКонтактноеЛицо = Элементы.Добавить("КонтактноеЛицо",Тип("ПолеФормы"),Элементы.ГруппаШапкаПраво);
		
		ПолеКонтактноеЛицо.Вид = ВидПоляФормы.ПолеВвода;
		
		ПолеКонтактноеЛицо.ПутьКДанным = "Объект.БС_КонтактноеЛицо";
		
	КонецПроцедуры 
	
	
	Процедура ДобавлениеЭлементовФормаДокументаПередСуммаДокумента(Форма);//добавляет поле контактное лицо
		
		ПолеКонтактноеЛицо = Форма.Элементы.Вставить("БС_КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.СуммаДокумента);
		
		ПолеКонтактноеЛицо.Вид = ВидПоляФормы.ПолеВвода;
		
		ПолеКонтактноеЛицо.ПутьКДанным = "Объект.БС_КонтактноеЛицо";
		
	КонецПроцедуры 
	
	// добавление реквизита документа на форму списка
	Процедура ПриСозданииНаСервереФормаСписка(Форма) Экспорт 
		
		ПолеКонтактноеЛицо = Форма.Элементы.Вставить("БС_КонтактноеЛицо",Тип("ПолеФормы"),Форма.Элементы.Список,Форма.Элементы.СуммаДокумента);
		
		ПолеКонтактноеЛицо.ПутьКДанным = "Список.Ссылка.БС_КонтактноеЛицо"; 
		
		ПолеКонтактноеЛицо.Вид = ВидПоляФормы.ПолеНадписи;
		
	КонецПроцедуры 
	
	#КонецОбласти
	
	
	
	
	
	
