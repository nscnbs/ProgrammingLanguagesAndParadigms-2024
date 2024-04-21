-- main_loop.adb
with Ada.Text_IO; use Ada.Text_IO;
with Library_loop; use Library_loop;

procedure Main_loop is
   -- Factorial
   N : Integer := 5;
   -- NWD
   Num1 : Integer := 36;
   Num2 : Integer := 48;
   -- Diofantic
   A : Integer := 120;
   B : Integer := 144;
   C : Integer := 72; -- x = -3, y = 3
   -- A : Integer := 18;
   -- B : Integer := 24;
   -- C : Integer := 30; -- x = -5, y = 5
   -- A : Integer := 120;
   -- B : Integer := 144;
   -- C : Integer := 71; -- brak
   Result : DiofanticResult;

begin
   -- Factorial
   Put(Integer'Image(N));
   Put("! = ");
   Put(Integer'Image(Factorial(N)));
   New_Line;

   -- NWD
   Put("NWD: ");
   Put(Integer'Image(Num1));
   Put(" i ");
   Put(Integer'Image(Num2));
   Put(" = ");
   Put(Integer'Image(NWD(Num1, Num2)));
   New_Line;

   -- Diofantic
   Result := Diofantic(A, B, C);
   if Result.X /= -1 and Result.Y /= -1 then
      Put("Rozwiazanie rownania ");
      Put(Integer'Image(A));
      Put("x + ");
      Put(Integer'Image(B));
      Put("y = ");
      Put(Integer'Image(C));
      Put(" to x = ");
      Put(Integer'Image(Result.X));
      Put(", y = ");
      Put(Integer'Image(Result.Y));
      New_Line;
   else
      Put("Brak rozwiazania dla rownania ");
      Put(Integer'Image(A));
      Put("x + ");
      Put(Integer'Image(B));
      Put("y = ");
      Put(Integer'Image(C));
      New_Line;
   end if;

end Main_loop;