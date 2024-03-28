import "dart:io";

void main()
{
  stdout.write("Enter the Number : ");
  int num = int.parse(stdin.readLineSync()!);
  int sum = 0;
  if(num > 0)
    {
      int rem = num % 10;
      sum = (sum + (rem*rem*rem));
      num = num~/10;

      if(num == sum)
        {
          stdout.write("This is Armstrong number");
        }
      else
        {
          stdout.write("This is not Armstrong number");
        }
    }
}