# GeekBrains Swift course
## 1. Swift Basics
### L1_Homework
1. Решить квадратное уравнение.
2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

### L2_Homework
1. Написать функцию, которая определяет, четное число или нет.
2. Написать функцию, которая определяет, делится ли число без остатка на 3.
3. Создать возрастающий массив из 100 чисел.
4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
5. Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов. Числа Фибоначчи определяются соотношениями Fn = Fn-1 + Fn-2.
6. Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
   - Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
   - Пусть переменная p изначально равна двум — первому простому числу.
   - Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
   - Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
   - Повторять шаги c и d, пока возможно.

### L3_Homework
1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.

### L4_Homework
1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
5. Создать несколько объектов каждого класса. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.