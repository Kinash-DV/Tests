#language: ru

@БыстреПроверки

Функционал: проверка формы элемента справочника Организации

Как Тестировщик я хочу
проверить доступность вкладок налоги и валюты
чтобы убедится, что пользователь не ошибется при вводе данных

Контекст:
	Дано Я открыл новый сеанс TestClient или подключил уже существующий	

//Сценарий: проверка доступности вкладок Налоги и Валюты в справочнике Организаций
//	* Открытие элемента справочника
//		И В командном интерфейсе я выбираю 'Справочники' 'Организации'
//		Тогда открылось окно 'Организации'
//		И я нажимаю на кнопку с именем 'FormCreate'
//		Тогда открылось окно 'Организация (создание)'
//	* Установка галочки "Наша компания" и проверка видимости на форме Валют и Видов налога
//		И я устанавливаю флаг с именем 'OurCompany'
//		И элемент формы "Валюты" присутствует на форме
//		И элемент формы "Вид налога" присутствует на форме
//	* Снятие галочки "Наша компания" и проверка отсутствия на форме Валют и Видов налога
//		И я снимаю флаг "Наша организация"
//		И элемент формы "Валюты" существует и невидим на форме
//		И элемент формы "Вид налога" существует и невидим на форме
//
//Сценарий: проверка функциональной опции использовать Организации в Заказе клиента
//	И Я устанавливаю в константу "UseCompanies" значение "False"
//	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
//	Тогда открылось окно 'Заказы покупателей'
//	И я нажимаю на кнопку с именем 'FormCreate'
//	И элемент формы "Организация" отсутствует на форме
//
//Сценарий: проверка заполнения справочника Организация
//	И В командном интерфейсе я выбираю 'Справочники' 'Организации'
//	Тогда открылось окно 'Организации'
//	И я нажимаю на кнопку с именем 'FormCreate'
//	Тогда открылось окно 'Организация (создание)'
//	И в поле с именем 'Description_ru' я ввожу текст 'Тестовый контрагент'
//	И из выпадающего списка с именем "Type" я выбираю точное значение 'Организация'
//	И я нажимаю на кнопку с именем 'FormWrite'
//	Тогда элемент формы с именем "Type" стал равен 'Организация'
//	Тогда элемент формы с именем "Description_ru" стал равен 'Тестовый контрагент'
//	И я нажимаю на кнопку с именем 'FormWriteAndClose'
//	И в таблице "List" я перехожу к строке:
//		| 'Наименование'        |
//		| 'Тестовый контрагент' |
//	И в таблице "List" я выбираю текущую строку
//	Тогда элемент формы с именем "Type" стал равен 'Организация'
//	Тогда элемент формы с именем "Description_ru" стал равен 'Тестовый контрагент'
//	И я закрываю все окна клиентского приложения

Сценарий: проверка расположения элементов на форме Организации
	И В командном интерфейсе я выбираю 'Справочники' 'Организации'
	Тогда открылось окно 'Организации'
	@screenshot
	И я нажимаю на кнопку с именем 'FormCreate'	
	Тогда открылось окно 'Организация (создание)'
