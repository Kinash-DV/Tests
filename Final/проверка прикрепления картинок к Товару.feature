#language: ru

@tree

Функционал: проверка прикрепления картинок к Товару

Как Тестировщик я хочу
проверить прикрепление картинок к Товару
чтобы иметь картинку товара в базе

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: подготовительный (прикрепления картинок к Товару)
	И я проверяю или создаю для справочника "Товары" объекты с обмен данными загрузка истина:
		| 'Ссылка'                                                            | 'Родитель'                                                          | 'ЭтоГруппа' | 'Код'       | 'Наименование' | 'Артикул' | 'ФайлКартинки' | 'Вид'                    |
		| 'e1cib/data/Справочник.Товары?ref=8ca2000d8843cd1b11dc9111f169782e' | 'e1cib/data/Справочник.Товары?ref=a100005056c0000811e3f7c0ef680671' | 'False'     | '000000035' | 'Йогурт'       | 'S564'    | ''             | 'Enum.ВидыТоваров.Товар' |
		| 'e1cib/data/Справочник.Товары?ref=a100005056c0000811e3f7c0ef680671' | 'e1cib/data/Справочник.Товары?ref=a9b200055d49b45e11db967987f1c226' | 'True'      | '000000099' | 'Молочные'     | ''        | ''             | ''                       |
		| 'e1cib/data/Справочник.Товары?ref=a9b200055d49b45e11db967987f1c226' | ''                                                                  | 'True'      | '000000011' | 'Продукты'     | ''        | ''             | ''                       |
	* Очистка файлов от более ранних загрузок
		И я выполняю код встроенного языка на сервере без контекста
		"""bsl
			Товар = Справочники.Товары.НайтиПоКоду("000000035");
			Если НЕ Товар.ФайлКартинки.Пустая() Тогда
				ТоварОбъект = Товар.ПолучитьОбъект();
				ТоварОбъект.ФайлКартинки = Неопределено;
				ТоварОбъект.Записать();
			КонецЕсли; 
			ФайлыТовара = Справочники.ХранимыеФайлы.Выбрать(,Товар);		
			Пока ФайлыТовара.Следующий() Цикл
				ФайлыТовара.ПолучитьОбъект().Удалить();
			КонецЦикла; 
		"""

Сценарий: проверка прикрепления картинок к Товару
	* Открываем карточку товара
		Дано Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=8ca2000d8843cd1b11dc9111f169782e"
		Тогда элемент формы с именем "ФайлКартинки" стал равен ''
	* Загрузка картинки
		И я нажимаю кнопку выбора у поля с именем "ФайлКартинки"
		Тогда открылось окно 'Файлы'
		И я нажимаю на кнопку с именем 'ФормаСоздать'
		Тогда открылось окно 'Файл (создание)'
		И в поле с именем 'Наименование' я ввожу текст 'йогурт'
		И я выбираю файл "$КаталогПроекта$\yogurt.jpg"
		И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
		И я жду закрытия окна 'йогурт (Файл)' в течение 20 секунд
		Тогда открылось окно 'Файлы'
		И я нажимаю на кнопку с именем 'ФормаВыбрать'
		Тогда открылось окно 'Йогурт (Товар) *'
		И я нажимаю на кнопку с именем 'ОбновитьКартинку'
		И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	* Проверка наличия картинки										
		Дано Я открываю навигационную ссылку "e1cib/data/Справочник.Товары?ref=8ca2000d8843cd1b11dc9111f169782e"
		Тогда элемент формы с именем "ФайлКартинки" стал равен 'йогурт'
		И поле с именем "Картинка" заполнено
		И	я закрываю все окна клиентского приложения
			