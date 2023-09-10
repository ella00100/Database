const range = document.getElementById("js-range");
const guess = document.getElementById("js-guess");
const result = document.getElementById("js-result");

function generateRandomNumber(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
}

const handlePrint = (e) => {
    e.preventDefault();

    const rangeMaxNum = parseInt(range.value);
    const randomNumber = generateRandomNumber(0, rangeMaxNum);
    const guessNum = parseInt(guess.querySelector("input").value); 
    
    const rangeSpan = document.querySelector("#js-title span");
    rangeSpan.innerHTML = `${rangeMaxNum}`
    
    const resultSpan = document.querySelector("#js-result span");

    if (guessNum === randomNumber) {
        resultSpan.innerHTML = `You choose: ${guessNum}, the machine choose: ${randomNumber}. <h3>You win!</h3>`;
    } else {
        resultSpan.innerHTML = `You choose: ${guessNum}, the machine choose: ${randomNumber}. <h3>You lose!</h3>`;
    }

};

guess.addEventListener("submit", handlePrint);
