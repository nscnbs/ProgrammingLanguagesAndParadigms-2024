-- library_rec.ads
package Library_rec is

   -- Struktura do przechowywania wyników równania diofantycznego
   type DiofanticResult is record
      X : Integer;
      Y : Integer;
   end record
     with Convention => C;

   -- Funkcja obliczająca silnię n!
   function Factorial(N : Integer) return Integer
     with Export, Convention => C, External_Name => "factorial";

   -- Funkcja obliczająca największy wspólny dzielnik dwóch liczb naturalnych
   function NWD(A, B : Integer) return Integer
     with Export, Convention => C, External_Name => "nwd";

   -- Funkcja rozwiązująca równanie diofantyczne ax + by = c
   function Diofantic(A, B, C : Integer) return DiofanticResult
     with Export, Convention => C, External_Name => "diofantic";

end Library_rec;