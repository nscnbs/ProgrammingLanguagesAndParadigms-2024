-- library_rec.adb
-- REKURSJA
with Library_rec; use Library_rec;

package body Library_rec is

   function Factorial(N : Integer) return Integer is
   begin
      if N = 0 or N = 1 then
         return 1;
      else
         return N * Factorial(N - 1);
      end if;
   end Factorial;

   function NWD(A, B : Integer) return Integer is
   begin
      if B = 0 then
         return A;
      else
         return NWD(B, A mod B);
      end if;
   end NWD;

   function Diofantic(A, B, C : Integer) return DiofanticResult is
      Result : DiofanticResult;
      GCD : Integer := NWD(A, B);
   begin
      if A = 0 and B = 0 then
         Result.X := -1;
         Result.Y := -1;
         return Result;
      end if;

      if A = 0 then
         if C mod B = 0 then
            Result.X := 0;
            Result.Y := C / B;
         else
            Result.X := -1;
            Result.Y := -1;
         end if;
         return Result;
      end if;

      if B = 0 then
         if C mod A = 0 then
            Result.X := C / A;
            Result.Y := 0;
         else
            Result.X := -1;
            Result.Y := -1;
         end if;
         return Result;
      end if;

      if C mod GCD /= 0 then
         Result.X := -1;
         Result.Y := -1;
         return Result;
      end if;

      declare
         TempResult : DiofanticResult := Diofantic(B, A mod B, C);
      begin
         if TempResult.X = -1 and TempResult.Y = -1 then
            Result.X := -1;
            Result.Y := -1;
            return Result;
         end if;

         Result.X := TempResult.Y;
         Result.Y := TempResult.X - (A / B) * TempResult.Y;
      end;

      return Result;
   end Diofantic;

end Library_rec;