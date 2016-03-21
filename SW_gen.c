#include<stdio.h>
#include<cmath>

int main(int argc, char *argv[])
{

  FILE *fp;
  fp = fopen("../verilog/ROM.v", "w");
  double i;
  int count;
  
  for (count = 0, i = 0.00; i < 90; i += 1.40625, count++) {
	double x = sin(M_PI * i / 180);
    int sine = (int) 256 * x;
    fprintf(fp, "%d:\n", count);
    fprintf (fp, "       data = %d\n", sine);
  }

  fclose(fp);
  
  return 0;
}
