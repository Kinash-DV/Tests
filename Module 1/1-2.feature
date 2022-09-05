﻿#language: ru

Функционал: Проверка допустимости услуг в документе Заказ

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Проверка допустимости услуг в документе Заказ
* Открытие формы заказа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Добавляем новую строку заказа и указываю услугу "Ремонт"
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000038' | 'Ремонт'       |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
* Попытка ввести количество услуг
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '10'
	И я перехожу к следующему реквизиту