let number = 2;
let divisor = number--;

while (number < 20) {

    if (number % number == 0 && number % 1 == 0 && number % divisor-- !=0 && number <20) {
        
        
        console.log(number);
        number++
        divisor= number - 1



        }
    
}

