import Data.Vect

=== ТЕОРИЯ ===

Type-Driven-Development (TypeDD) - это метод цикличного повторения следующих шагов:

Type -> Define -> Refine

Задача: для коллекции строк вычислить их длины

1) Type - выражение идей через типы или их взаимотношения
Чтобы посчитать длины строк в коллекции, очевидно, что нам нужна функция,
которая, будучи примененной к коллекции строк (Collection String),
вычислит коллекцию их длин (Collection Nat)

? : Collection String -> Collection Nat

allLengths : List String -> List Nat

2) Define
Определившись с типами, переходим к имплементации/определению логики, вручную
или с помощью Ctrl + Alt + A

allLengths : List String -> List String
allLengths xs = ?allLengths_rhs

1) Type

С помощью Ctrl + Alt + T можно проверить типы xs и allLengths_rhs

2) Define

C помощью Ctrl + Alt + C продолжаем определять логику

allLengths : List String -> List String
allLengths [] = ?allLengths_rhs_1
allLengths (x :: xs) = ?allLengths_rhs_2

3) Refine

Теперь справа у нас только дырки, которые мы можем уточнить

allLengths : Vect len String -> Vect len Nat

allLengths : List String -> List String
allLengths [] = []
allLengths (word :: words) = length word :: allLengths words

=== ПРАКТИКА ===

Вопрос?
Ответ
Вопрос?
Ответ

allLengths : Vect len String -> Vect len Nat

Что такое "allLengths"?
Что такое "String"? Приведите примеры его обитателей
Что такое "Nat"? Приведите примеры его обитателей. Приведите примеры чисел-его-необитателей
Что такое "Vect len String"? Приведите примеры его обитатей
Что такое "Vect"? Какого оно типа?
Что такое "Vect len"? Какого оно типа?
В "Vect len String", какова семантика значений "len"?
В "Vect len String", какова семантика значений типа "String"?

Сколько входных значений у этой функции?
Сколько выходных значений у этой функции?
Бывают ли функции с более чем одним выходным значением? (это справедливо для всех попурярных ЯП: JS, Java, Python, ...)

allLengths : Vect len String -> Vect len Nat
allLengths [] = ?allLengths_rhs_1
allLengths (word :: words) = ?allLengths_rhs_2

Что такое первое строчка?
Что такое вторая и третья строчки?
Что такое "(word :: words)"?
Что такое ?allLengths_rhs_1 и ?allLengths_rhs_2? Какие у них типы?
Почему дырка называется дыркой? Как Idris знает (когда Ctrl + Alt + T на ней) какой формы дырка? Например allLengths_rhs_1
Как синтаксически обозначается дырка в Idris?

allLengths : Vect len String -> Vect len Nat
allLengths [] = []
allLengths (word :: words) = 0 :: allLenghts words

Что такое "0 :: allLenghts words"? У этого есть тип?
Что такое (::)? Какой у этого тип?
Какова семантика этого "0"?
Какова семантика "allLenghts words"?
Как называется, когда функция вызывает сама себя?

allLengths : Vect len String -> Vect len Nat
allLengths [] = []
allLengths (word :: words) = (0) (::) (allLenghts words)

Проверьте возможно ли расставить вот так скобки, чтобы визуально расставить приоритеты?
Как в математике: то что в скобках вычисляется первым. Расставьте действия вычисления выражения "(0) (::) (allLenghts words)" по порядку их вычисления

Почему даже когда нет скобок
allLengths : Vect len String -> Vect len Nat
allLengths [] = []
allLengths (word :: words) = 0 :: allLenghts words
Idris знает, что сначала нужно вычислить "allLengths words", а затем прикручивать к этому голову

Смотря исключительно на тип, какую дополнительную гарантию тип Vect предлагает против типа List?

allLengths : Vect len String -> Vect len Nat

allLengths : List String -> List Nat

Решите задачу счета длин строк коллекции с помощью типа коллекции List, а не Vect.

"Переведите" решение с языка Idris на язык JS (используя массивы в JS)
Подсказка: эквивалент (::) в JS можно реализовать с помощью spread
[1, ...[2, 3]] => [1, 2, 3]
word = "first"
words = ["second", "third"]
[ words, ...words ] => ["first", "second", "third"]
