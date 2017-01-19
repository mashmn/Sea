#include <stdio.h>

int main()
{
	double number_1, number_2,answer;
	char operation;
	
	printf("Enter first value: ");
	scanf("%lf", &number_1);
	
	printf("Enter second value: ");
	scanf("%lf", &number_2);
	
	printf("\nThe values are %f & %f\n\n",number_1,number_2);
	
	printf("Type the operation (+-*/): ");
	scanf(" %c",&operation);
	printf("\n\n%c operation was chosen!\n",operation);
	
	switch(operation){
		
		case '+':
			answer=number_1+number_2;
			printf("The added value of %f & %f is %f\n",number_1,number_2,answer);
			break;
		case '-':
			answer=number_1-number_2;
			printf("The subtracted value of %f & %f is %f\n",number_1,number_2,answer);
			break;
		case '*':
			answer=number_1*number_2;
			printf("The multiplied value of %f & %f is %f\n",number_1,number_2,answer);
			break;
		case '/':
			if (number_2==0){
				printf("Error:Divide by zero\n");
				printf("   operation ignored\n");
			}
			else{
			answer=number_1/number_2;
			printf("The divided value of %f & %f is %f\n",number_1,number_2,answer);
			}
			break;
		default:
			printf("Unknown operator %c\n", operation);
            break;
	}
	
	return 0;
	
}