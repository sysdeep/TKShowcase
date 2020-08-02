#include <stdlib.h>
#include <stdio.h>
#include <tcl.h>
#include <tk.h>
#include <string.h>




Tcl_Interp * tcl_interp ;

int lenStr(){
    int code;
    int len;
    char slen[256];
    char *res;
/*Читаем из widget-а введенную строку в переменную tcl с именем a*/
    code = Tcl_Eval(tcl_interp, "set a [.ent1 get];");
/*Присваиваем значение tcl-переменной a строке res в нашем коде:*/
    res = (char *)Tcl_GetVar(tcl_interp, "a", TCL_APPEND_VALUE);
/*Вычисляем средствами языка C длину прочитанной строки:*/
    len = strlen(res);
/*Переводим длину в строку*/
    slen[0] = '\0';
    sprintf(slen, "%i", len);
/*Теперь полученное значение slen присваиваем Tcl-переменной  lens:*/
    Tcl_SetVar(tcl_interp, "lens", slen, TCL_GLOBAL_ONLY);
/*Чистим виджет, в который будет записана длина введенной строки*/
    code = Tcl_Eval(tcl_interp, ".ent4 delete 0 end;");
/*И в чистый виджет вставляем полученное значене*/
    code = Tcl_Eval(tcl_interp, ".ent4 insert 0 $lens;");
/*И возвращаемся*/
    return TCL_OK;
}


int main (int argc, char *argv[]) {
/*Tcl/Tk - скрипт нашего примера  */
    char strtcl[] ="\
	wm title . \"Пример программы на C с Tcl/Tk\";\
	label .lab0 -text {strlen(};\
	pack .lab0 -anchor {center}  -side {left};\
	entry .ent1 ;\
	pack .ent1 -anchor {center} -side {left};\
	label .lab2  -text {)};\
	pack .lab2 -anchor {center} -side {left};\
	button .but3  -text {=} -command {lenstr};\
	pack .but3 -anchor {center} -side {left};\
	entry .ent4  -width {5};\
	pack .ent4  -pady {4} -side {top};\
	pack .lab0 .ent1 .lab2 .but3 .ent4 -in {.};\
	.ent4 delete 0 end;\
    ";
    int code;
    Tcl_FindExecutable(argv[0]);
/*Создание tcl-интерпретатора*/
    tcl_interp = Tcl_CreateInterp();
/*Инициализация созданного tcl-интерпретатора*/
    Tcl_Init(tcl_interp);
/*Инициализация Tk-интерпретатора в контексте созданного tcl-интерпретатора*/
    Tk_Init(tcl_interp);
/*Загружаем наш Tcl/Tk код из строки*/
    code = Tcl_Eval(tcl_interp, strtcl);
/*Но Tcl/Tk код можно загрузить и из файла:
    code = Tcl_EvalFile(tcl_interp, filetcl);
*/
/*Добавляем к нашей кнопки вызов процедуры lenstr при ее нажатии*/
    code = Tcl_Eval(tcl_interp, ".but3  configure -command lenstr;");
/*Связываем имя процедуры "lenstr" с функцией lenStr в этом C-коде*/
    Tcl_CreateCommand(tcl_interp, "lenstr", (Tcl_CmdProc *)lenStr, NULL, NULL);
/*Главный цикл обработки событий от виджетов*/
    Tk_MainLoop();
    return 0;
}