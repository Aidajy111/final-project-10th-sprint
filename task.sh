#!/bin/bash

# создаём каталог task с вложенными директориями
# task
#   dir1
#   dir2
#   dir3
#       dir4

mkdir /tmp/task
mkdir /tmp/task/dir1 /tmp/task/dir2 /tmp/task/dir3 /tmp/task/dir3/dir4

# изменяем текущую директорию на task

cd /tmp/task

# создаём пустой файл task/dir2/empty

touch ./dir2/empty

# создаём файл task/dir2/hello.sh с таким содержанием:
# #!/bin/bash
# echo "$1, привет!"
touch ./dir2/hello.sh
nano ./dir2/hello.sh

# устанавливаем для task/dir2/hello.sh права rwxrw-r--
chmod 764 ./dir2/hello.sh

# сохраняем список файлов task/dir2 в task/dir2/list.txt
ls ./dir2/ > ./dir2/list.txt

# копируем содержимое каталога task/dir2 в каталог task/dir3/dir4
cp -r ./dir2/* ./dir3/dir4/

# записываем в task/dir1/summary.txt список файлов с расширением *.txt
# находящихся в task, включая поддиректории
find . -type f -name "*.txt" > dir1/summary.txt

# дописываем в task/dir1/summary.txt содержимое task/dir2/list.txt
cat dir2/list.txt >> dir1/summary.txt

# определяем переменную окружения NAME со значением "Всем студентам"
export NAME="Всем студентам"
echo "$NAME"

# запускаем task/dir2/hello.sh с переменной окружения NAME в качестве аргумента
# вывод скрипта должен дописаться в файл task/dir1/summary.txt
./dir2/hello.sh "$NAME" >> dir1/summary.txt

# перемещаем с переименованием task/dir1/summary.txt в task/Практическое задание
mv ./dir1/summary.txt ./Practical\ lesson

# выводим на консоль содержимое файла task/Практическое задание
cat Practical

# ищем в файле "Практическое задание" строки, которые содержат слово "dir"
# и затем отсортировываем их
grep "dir" "Practical" | sort

# меняем текущую директорию на родительскую для task
cd ../

# удаляем директорию task со всем содержимым
rm -r task
