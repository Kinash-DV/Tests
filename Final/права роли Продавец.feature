#language: ru

@tree

Функционал: права роли Продавец

Сценарий: подготовительный этап (права роли Продавец)
	Дано я подключаю TestClient "Этот клиент" логин "Администратор" пароль ""
	И экспорт настроек и справочников
	И экспорт документов и проводок
	И я закрываю сеанс текущего клиента тестирования

Сценарий: проверка прав роли Продавец на документ Заказ
	Дано я подключаю TestClient "Этот клиент" логин "Продавец" пароль ""
	* Проверка видимости документов
		И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
		Тогда открылось окно 'Заказы товаров'
		И В таблице "Список" количество строк "больше" 0
	* Проверка отсутствия прав на редактирование
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Заказ * от *'
		Попытка
			И я нажимаю на кнопку с именем 'ФормаЗаписать'
		Исключение
			И я запоминаю текст ошибки в переменную "ОшибкаЗаписи"
		Если НЕ существует переменная "ОшибкаЗаписи" Тогда
			Тогда я вызываю исключение "Для заказа доступна запись"
		И я удаляю переменную 'ОшибкаЗаписи'
	И я закрываю все окна клиентского приложения
	И я закрываю сеанс текущего клиента тестирования
	Дано я подключаю TestClient "Этот клиент" логин "Администратор" пароль ""

Сценарий: проверка прав роли Продавец на документ Продажа
	Дано я подключаю TestClient "Этот клиент" логин "Продавец" пароль ""
	
	* открытие нового
		И я закрываю все окна клиентского приложения
		И В командном интерфейсе я выбираю 'Продажи' 'Продажи'
		Тогда открылось окно 'Продажи товара'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Продажа товара (создание)'

	* заполнение документа
		И в поле с именем 'Дата' я ввожу текст '01.09.2022  0:00:00'
		И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Товары"'
		И я нажимаю кнопку выбора у поля с именем "Покупатель"
		Тогда открылось окно 'Контрагенты'
		И в таблице  "Список" я перехожу на один уровень вниз
		И в таблице "Список" я перехожу к строке:
			| 'Код'       | 'Наименование'           |
			| '000000016' | 'Магазин "Мясная лавка"' |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Продажа товара (создание) *'
		И из выпадающего списка с именем "Склад" я выбираю точное значение 'Малый'
		И из выпадающего списка с именем "ВидЦен" я выбираю точное значение 'Розничная'
		И из выпадающего списка с именем "Валюта" я выбираю точное значение 'EUR'
		И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
		И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
		Тогда открылось окно 'Товары'
		И я нажимаю на кнопку с именем 'ФормаСписок'
		И в таблице "Список" я перехожу к строке:
			| 'Артикул' | 'Код'       | 'Количество' | 'Наименование' |
			| 'Kol67'   | '000000030' | '352,00'     | 'Колбаса'      |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Продажа товара (создание) *'
		И в таблице "Товары" я завершаю редактирование строки

	* проверка возможности проведения документа
		И я нажимаю на кнопку с именем 'ФормаПровести'
		Тогда не появилось окно предупреждения системы

	* отменяем проведение документа и выход
		И я нажимаю на кнопку с именем 'ФормаОтменаПроведения'
		И я закрываю все окна клиентского приложения
		И я закрываю сеанс текущего клиента тестирования
		Дано я подключаю TestClient "Этот клиент" логин "Администратор" пароль ""
