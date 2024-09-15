

#include <stdio.h>
#include <string>
#include <map>

//This is symbol table data structure.
static std::map<std::string, double> symbolTable;

double performBinaryOperation (double lhs, double rhs, int op) {
 	switch(op) {
 		case '+':
 			return lhs + rhs;
 		case '-':
 			return lhs - rhs;
 		case '*':
 			return lhs * rhs;
 		case '/':
 			return lhs / rhs;
 		default:
 			return 0;
 	}
}
 
void print(const char* format, const char* value) {
	printf(format, value);
}

void print(const char* format, double value) {
	printf(format, value);
}


void setValueInSymbolTable(const char* id, double value) {
	std::string name(id);
	symbolTable[name] = value;
}

double getValueFromSymbolTable(const char* id) {
	std::string name(id);
	if (symbolTable.find(name) != symbolTable.end()) {
		return symbolTable[name];
	}
	return 0; // this is the default value for an identifier.
}
