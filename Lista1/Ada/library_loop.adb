-- library_loop.adb
-- PETLE
with Ada.Text_IO; use Ada.Text_IO;
with Library_loop; use Library_loop;

package body Library_loop is

   function Factorial(N : Integer) return Integer is
      Result : Integer := 1;
   begin
      for I in 1 .. N loop
         Result := Result * I;
      end loop;
      return Result;
   end Factorial;

   function NWD(A, B : Integer) return Integer is
      Temp : Integer;
      A_Copy : Integer := A;
      B_Copy : Integer := B;
   begin
      if B_Copy = 0 then
         return A_Copy;
      else
         while B_Copy /= 0 loop
            Temp := B_Copy;
            B_Copy := A_Copy mod B_Copy;
            A_Copy := Temp;
         end loop;
         return A_Copy;
      end if;
   end NWD;

   function Diofantic(A, B, C : Integer) return DiofanticResult is
      Result : DiofanticResult;
      NWD_AB : Integer := NWD(A, B);
      A_Copy : Integer := A;
      B_Copy : Integer := B;
      C_Copy : Integer := C;
   begin
      if C_Copy mod NWD_AB = 0 then
         -- Rozwiązanie istnieje tylko wtedy, gdy C jest podzielne przez NWD(A, B)
         Result.X := 0;
         Result.Y := 0;

         A_Copy := A_Copy / NWD_AB;
         B_Copy := B_Copy / NWD_AB;
         C_Copy := C_Copy / NWD_AB;

         -- Rozszerzony algorytm Euklidesa
         declare
            X0 : Integer := 1;
            Y0 : Integer := 0;
            X1 : Integer := 0;
            Y1 : Integer := 1;
            Temp : Integer;
            Q : Integer;
         begin
            while B_Copy /= 0 loop
               Q := A_Copy / B_Copy;
               Temp := B_Copy;
               B_Copy := A_Copy mod B_Copy;
               A_Copy := Temp;

               Temp := X0;
               X0 := X1;
               X1 := Temp - Q * X1;

               Temp := Y0;
               Y0 := Y1;
               Y1 := Temp - Q * Y1;
            end loop;

            Result.X := X0 * C_Copy;
            Result.Y := Y0 * C_Copy;
         end;
      else
         Result.X := -1;
         Result.Y := -1;
      end if;

      return Result;
   end Diofantic;

end Library_loop;